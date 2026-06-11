# ShadcnDaisyUI — agent rules for consuming apps

This app uses the ShadcnDaisyUI token package. **Every UI decision goes
through the design system.** The full guidelines ship in this package
(`Sources/ShadcnDaisyUI/Resources/design-guidelines.md`, or
`Guidelines.markdown()` at runtime) — read the relevant section before
building UI. Rules tagged `[ios]` apply here; `[web]` rules do not.

## Non-negotiables

- Colors: ONLY `Color.sd*` tokens (`sdBackground`, `sdForeground`, `sdPrimary`,
  `sdMuted`, `sdMutedForeground`, `sdDestructive`, `sdBorder`, status colors).
  Never `Color(red:green:blue:)`, hex literals, or `.gray`-style system colors
  for themed surfaces. Never branch on `colorScheme` to pick colors — dark
  variants are baked into the tokens.
- Spacing: only `Spacing.s1/s2/s3/s4/s6/s8/s12` (4/8/12/16/24/32/48pt).
  No off-grid values. SwiftUI's default `.padding()` (16pt) is on-grid.
- Typography: only the `Font.sd*` roles (`sdPageTitle`, `sdTitle`,
  `sdSubtitle`, `sdBody`, `sdControl`, `sdLabel`). Never
  `Font.system(size:)` for content text — the roles ride Dynamic Type.
- Radius: continuous corners via `Radius.sm/md/lg/xl` (6/8/10/14pt).
  `md` fields/buttons, `lg` menus/popovers, `xl` cards/dialogs, Capsule for
  pills/badges/avatars.
- Shadows: `Elevation.xs` (controls) and `Elevation.sm` (cards/overlays) are
  the ceiling; prefer system materials for overlays.
- Motion: `Motion.micro/surface/sheet` presets or system presentation
  animations; no springs with visible overshoot; respect
  `accessibilityReduceMotion`.
- Touch targets: 44×44pt minimum effective hit area — small visuals get
  `.frame(minWidth: 44, minHeight: 44).contentShape(Rectangle())`.

## HIG arbitration

Apple's HIG wins for: navigation chrome (`TabView`, `NavigationStack`/
`NavigationSplitView`, back behavior), system gestures (swipe-back), and
system surfaces (alerts, action sheets, share sheets, keyboards). These
guidelines win for: spacing, type roles and weights, color semantics, radius.
Never invent a third option.

## Patterns

- Navigation: `TabView` (3–5 destinations) on compact; `NavigationSplitView`
  on regular width. Branch on size classes, never device idiom.
- Push = drill-down; `.sheet` (with detents) = self-contained task. The system
  back gesture is sacred — no custom back buttons.
- One `sdPrimary`-emphasis action per view region; destructive actions use
  `role: .destructive` and a confirmation that names the object.
- Accessibility: every tappable element labeled; composite rows combined with
  `.accessibilityElement(children: .combine)`; support Dynamic Type ±1 step
  minimum.
- Text: sentence case; buttons start with verbs; errors say what happened and
  how to fix it.
