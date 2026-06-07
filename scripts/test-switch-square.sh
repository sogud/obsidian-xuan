#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PORT="${XUAN_SWITCH_TEST_PORT:-4177}"
SESSION="xuan-switch"
PWCLI="${PWCLI:-${CODEX_HOME:-$HOME/.codex}/skills/playwright/scripts/playwright_cli.sh}"

if [[ ! -x "$PWCLI" && -x "$HOME/.agents/skills/playwright/scripts/playwright_cli.sh" ]]; then
  PWCLI="$HOME/.agents/skills/playwright/scripts/playwright_cli.sh"
fi

if [[ ! -x "$PWCLI" ]]; then
  echo "Playwright CLI wrapper not found. Set PWCLI=/path/to/playwright_cli.sh" >&2
  exit 1
fi

cd "$ROOT_DIR"
npm run build
mkdir -p output/playwright

python3 -m http.server "$PORT" --bind 127.0.0.1 >/tmp/xuan-switch-test-server.log 2>&1 &
SERVER_PID=$!

cleanup() {
  "$PWCLI" -s="$SESSION" close >/dev/null 2>&1 || true
  kill "$SERVER_PID" >/dev/null 2>&1 || true
}
trap cleanup EXIT

"$PWCLI" -s="$SESSION" open "http://127.0.0.1:$PORT/tests/fixtures/switch-square.html" >/dev/null

RESULT="$("$PWCLI" -s="$SESSION" eval "(() => {
  const el = document.querySelector('#switch');
  const matrix = (value) => value === 'none' ? new DOMMatrixReadOnly() : new DOMMatrixReadOnly(value);
  const px = (value) => Number.parseFloat(value) || 0;
  const read = () => {
    const cs = getComputedStyle(el);
    const after = getComputedStyle(el, '::after');
    const transform = matrix(after.transform);
    const trackBorderWidth = px(cs.borderTopWidth);
    const thumbEffectiveTop = px(after.top) + transform.m42;
    const thumbEffectiveLeft = px(after.left) + transform.m41;
    return {
      trackRadius: cs.borderRadius,
      thumbRadius: after.borderRadius,
      trackWidth: cs.width,
      trackHeight: cs.height,
      thumbWidth: after.width,
      thumbHeight: after.height,
      thumbTop: after.top,
      thumbLeft: after.left,
      thumbTranslateX: Math.round(transform.m41),
      thumbTranslateY: Math.round(transform.m42),
      thumbEffectiveTop: Math.round(thumbEffectiveTop),
      thumbEffectiveLeft: Math.round(thumbEffectiveLeft),
      thumbVisualTopInset: Math.round(trackBorderWidth + thumbEffectiveTop),
      thumbVisualBottomInset: Math.round(px(cs.height) - (trackBorderWidth + thumbEffectiveTop + px(after.height))),
      thumbVisualLeftInset: Math.round(trackBorderWidth + thumbEffectiveLeft),
      thumbVisualRightInset: Math.round(px(cs.width) - (trackBorderWidth + thumbEffectiveLeft + px(after.width))),
      trackBackground: cs.backgroundColor,
      trackBorderColor: cs.borderTopColor,
      thumbBackground: after.backgroundColor,
      overflow: cs.overflow,
      display: cs.display,
      boxSizing: cs.boxSizing
    };
  };

  const enabled = read();
  el.classList.remove('is-enabled');
  const disabled = read();
  el.classList.add('is-enabled');

  const failures = [];
  const expect = (actual, expected, label) => {
    if (actual !== expected) failures.push(label + ': expected ' + expected + ', got ' + actual);
  };

  for (const [label, values] of Object.entries({ enabled, disabled })) {
    expect(values.trackRadius, '0px', label + ' track radius');
    expect(values.thumbRadius, '0px', label + ' thumb radius');
    expect(values.trackWidth, '44px', label + ' track width');
    expect(values.trackHeight, '24px', label + ' track height');
    expect(values.thumbWidth, '20px', label + ' thumb width');
    expect(values.thumbHeight, '20px', label + ' thumb height');
    expect(values.thumbLeft, '1px', label + ' thumb left');
    expect(values.thumbTranslateY, -10, label + ' thumb vertical translation');
    expect(values.thumbVisualTopInset, 2, label + ' thumb visual top inset');
    expect(values.thumbVisualBottomInset, 2, label + ' thumb visual bottom inset');
    expect(values.thumbBackground, 'rgb(255, 253, 249)', label + ' thumb color');
    expect(values.overflow, 'hidden', label + ' overflow');
    expect(values.boxSizing, 'border-box', label + ' box sizing');
  }

  expect(enabled.thumbTranslateX, 20, 'enabled thumb translation');
  expect(disabled.thumbTranslateX, 0, 'disabled thumb translation');
  expect(enabled.thumbVisualRightInset, 2, 'enabled thumb visual right inset');
  expect(disabled.thumbVisualLeftInset, 2, 'disabled thumb visual left inset');
  expect(enabled.trackBackground, 'rgb(231, 221, 211)', 'enabled track color');
  expect(disabled.trackBackground, 'rgb(244, 239, 231)', 'disabled track color');
  expect(enabled.trackBorderColor, 'rgb(206, 192, 179)', 'enabled border color');
  expect(disabled.trackBorderColor, 'rgb(216, 208, 196)', 'disabled border color');

  if (failures.length) {
    throw new Error('Switch regression:\\n' + failures.join('\\n') + '\\n' + JSON.stringify({ enabled, disabled }, null, 2));
  }

  return JSON.stringify({ enabled, disabled }, null, 2);
})()")"
echo "$RESULT"
if grep -q "### Error" <<<"$RESULT"; then
  exit 1
fi

"$PWCLI" -s="$SESSION" resize 240 132 >/dev/null
"$PWCLI" -s="$SESSION" screenshot --filename output/playwright/switch-square.png >/dev/null
