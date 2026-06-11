# ShadcnDaisyUI (Swift)

Design tokens for native iOS / iPadOS apps, mirroring the
[shadcn_daisyui](https://github.com/N00nDay/shadcn_daisyui) web design system:
semantic colors (light + dark baked in), the 4pt spacing grid, the radius
scale, the six-role type ramp, motion presets, and the elevation ladder — plus
the full design guidelines bundled as markdown.

Tokens only, by design: SwiftUI components are built per-app against these
tokens (and may graduate into this package as they prove out).

## Install

Add the package in Xcode (File → Add Package Dependencies) or in `Package.swift`:

```swift
.package(url: "<repo url>", from: "0.1.0")
```

## Use

```swift
import ShadcnDaisyUI

VStack(spacing: Spacing.s4) {
    Text("Settings").font(.sdPageTitle).foregroundStyle(Color.sdForeground)
    Text("Manage your account").font(.sdControl).foregroundStyle(Color.sdMutedForeground)
}
.padding(Spacing.s6)
.background(Color.sdCard, in: .rect(cornerRadius: Radius.xl, style: .continuous))
.sdShadow(Elevation.sm)
```

Rules of the road (the bundled guidelines are the full reference):

- **Colors**: only `Color.sd*` tokens — never `Color(red:green:blue:)` or
  asset literals in views. Dark mode is in the token; never branch on
  `colorScheme` for colors.
- **Spacing**: only the blessed steps (4/8/12/16/24/32/48pt).
- **Type**: only the `Font.sd*` roles — they ride Dynamic Type.
- **Radius**: continuous corners at 6/8/10/14pt by role.
- **Touch targets**: 44×44pt minimum effective hit area.
- **HIG arbitration**: Apple owns navigation chrome, gestures, and system
  surfaces; these tokens own spacing, type roles, color semantics, and radius.

## Guidelines

The complete design guidelines ship in the package:

```swift
let md = try Guidelines.markdown()
```

They are also served by the docs site at `/design-guidelines.md`, with the
human-browsable version under Foundations and Styles. To keep an AI coding
agent on the rails in a consuming project, copy `AGENTS.md` from this package
into the project root (or reference it from yours).

## Keeping tokens in sync

Token values trace to the web theme's CSS — `TOKENS.md` maps every Swift
constant to the CSS variable and OKLCH value it mirrors. When the web theme
changes: update `TOKENS.md`, update the constants, and the unit tests will
hold you honest (`swift test`).
