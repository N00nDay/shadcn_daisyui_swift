# Token traceability

Every Swift constant maps to a CSS variable in the shadcn_daisyui web theme
(`priv/static/shadcn-daisyui.css`). Colors were converted OKLCH → sRGB once
(standard OKLab matrices, gamut-clipped); when the web theme changes, update
this table and the constants, and `swift test` verifies the values.

## Colors (light / dark)

| Swift (`SDColors.`) | CSS variable | OKLCH light → sRGB | OKLCH dark → sRGB |
|---|---|---|---|
| background | `--background` | `1 0 0` → 1, 1, 1 | `0.145 0 0` → 0.0394 ×3 |
| foreground | `--foreground` | `0.145 0 0` → 0.0394 ×3 | `0.985 0 0` → 0.9803 ×3 |
| card / popover | `--card` / `--popover` | `1 0 0` → 1, 1, 1 | `0.205 0 0` → 0.0905 ×3 |
| primary | `--primary` | `0.205 0 0` → 0.0905 ×3 | `0.922 0 0` → 0.8982 ×3 |
| primaryForeground | `--primary-foreground` | `0.985 0 0` → 0.9803 ×3 | `0.205 0 0` → 0.0905 ×3 |
| secondary / muted / accent | `--secondary` / `--muted` / `--accent` | `0.97 0 0` → 0.9606 ×3 | `0.269 0 0` → 0.1494 ×3 |
| mutedForeground | `--muted-foreground` | `0.556 0 0` → 0.4515 ×3 | `0.708 0 0` → 0.6302 ×3 |
| destructive | `--destructive` | `0.577 0.245 27.325` → 0.9065, 0, 0.0422 (clipped) | `0.704 0.191 22.216` → 1, 0.3912, 0.4039 (clipped) |
| border | `--border-color` | `0.922 0 0` → 0.8982 ×3 | `1 0 0 / 10%` → white @ 0.10 |
| input | `--input` | `0.922 0 0` → 0.8982 ×3 | `1 0 0 / 15%` → white @ 0.15 |
| ring | `--ring` | `0.708 0 0` → 0.6302 ×3 | `0.556 0 0` → 0.4515 ×3 |
| surfaceSubtle | `--color-base-200` | `0.97 0 0` → 0.9606 ×3 | `0.205 0 0` → 0.0905 ×3 |
| info | `--color-info` | `0.62 0.19 260` → 0.2265, 0.5046, 0.9651 | `0.68 0.16 255` → 0.2994, 0.6017, 0.9733 |
| success | `--color-success` | `0.65 0.15 150` → 0.2271, 0.658, 0.3581 | `0.7 0.14 155` → 0.2773, 0.7196, 0.4667 |
| warning | `--color-warning` | `0.78 0.16 75` → 0.9491, 0.6513, 0.095 | `0.8 0.15 80` → 0.9403, 0.6958, 0.2067 |
| status foregrounds | `--color-*-content` | `0.985 0 0` → 0.9803 ×3 (warning: `0.205`) | `0.145 0 0` → 0.0394 ×3 |

## Metrics

| Swift | Value | CSS source |
|---|---|---|
| `Spacing.s1…s12` | 4, 8, 12, 16, 24, 32, 48 pt | the blessed Tailwind steps (foundations-spacing.md) |
| `Radius.sm/md/lg/xl` | 6, 8, 10, 14 pt | `--radius: 0.625rem` ± offsets |
| `Motion.micro/surface/sheet` | 0.15 / 0.18 / 0.30 s | btn transition 150ms; command 0.18s; sheet/drawer 0.3s |
| `Elevation.xs` | black @ 5%, r1, y1 | `--shadow-xs: 0 1px 2px 0 oklch(0 0 0 / 0.05)` |
| `Elevation.sm` | black @ 10%, r1.5, y1 | `--shadow-sm: 0 1px 3px 0 oklch(0 0 0 / 0.1)` (first layer) |

Notes:
- `Elevation.sm` approximates the web's two-layer shadow with its dominant layer.
- Greyscale OKLCH (`C = 0`) converts to equal-channel sRGB; "×3" above means
  the value repeats for r, g, b.
