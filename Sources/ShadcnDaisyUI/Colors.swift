import SwiftUI

/// A semantic color token with light and dark variants baked in.
///
/// Values are sRGB conversions of the shadcn_daisyui theme's OKLCH tokens -
/// see TOKENS.md for the traceability table. Views never reference literal
/// colors; they use the `Color.sd*` accessors below.
public struct SDColor: Sendable, Equatable {
    public struct Components: Sendable, Equatable {
        public let red: Double
        public let green: Double
        public let blue: Double
        public let opacity: Double

        public init(_ red: Double, _ green: Double, _ blue: Double, _ opacity: Double = 1.0) {
            self.red = red
            self.green = green
            self.blue = blue
            self.opacity = opacity
        }
    }

    public let light: Components
    public let dark: Components

    public init(light: Components, dark: Components) {
        self.light = light
        self.dark = dark
    }

    /// A dynamic Color that resolves per the current color scheme.
    public var color: Color {
        #if canImport(UIKit)
            return Color(
                UIColor { traits in
                    let c = traits.userInterfaceStyle == .dark ? dark : light
                    return UIColor(
                        red: c.red, green: c.green, blue: c.blue, alpha: c.opacity)
                })
        #elseif canImport(AppKit)
            return Color(
                NSColor(
                    name: nil,
                    dynamicProvider: { appearance in
                        let isDark =
                            appearance.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua
                        let c = isDark ? dark : light
                        return NSColor(
                            srgbRed: c.red, green: c.green, blue: c.blue, alpha: c.opacity)
                    }))
        #else
            return Color(
                .sRGB, red: light.red, green: light.green, blue: light.blue,
                opacity: light.opacity)
        #endif
    }
}

/// The semantic palette. Mirrors the web theme's tokens
/// (`--background`, `--primary`, `--destructive`, …).
public enum SDColors {
    public static let background = SDColor(
        light: .init(1.0, 1.0, 1.0), dark: .init(0.0394, 0.0394, 0.0394))
    public static let foreground = SDColor(
        light: .init(0.0394, 0.0394, 0.0394), dark: .init(0.9803, 0.9803, 0.9803))
    public static let card = SDColor(
        light: .init(1.0, 1.0, 1.0), dark: .init(0.0905, 0.0905, 0.0905))
    public static let cardForeground = foreground
    public static let popover = card
    public static let popoverForeground = foreground
    public static let primary = SDColor(
        light: .init(0.0905, 0.0905, 0.0905), dark: .init(0.8982, 0.8982, 0.8982))
    public static let primaryForeground = SDColor(
        light: .init(0.9803, 0.9803, 0.9803), dark: .init(0.0905, 0.0905, 0.0905))
    public static let secondary = SDColor(
        light: .init(0.9606, 0.9606, 0.9606), dark: .init(0.1494, 0.1494, 0.1494))
    public static let secondaryForeground = SDColor(
        light: .init(0.0905, 0.0905, 0.0905), dark: .init(0.9803, 0.9803, 0.9803))
    public static let muted = secondary
    public static let mutedForeground = SDColor(
        light: .init(0.4515, 0.4515, 0.4515), dark: .init(0.6302, 0.6302, 0.6302))
    public static let accent = secondary
    public static let accentForeground = secondaryForeground
    public static let destructive = SDColor(
        light: .init(0.9065, 0.0, 0.0422), dark: .init(1.0, 0.3912, 0.4039))
    public static let destructiveForeground = SDColor(
        light: .init(0.9803, 0.9803, 0.9803), dark: .init(0.9803, 0.9803, 0.9803))
    /// 1px separators. Dark mode uses white at 10% like the web theme.
    public static let border = SDColor(
        light: .init(0.8982, 0.8982, 0.8982), dark: .init(1.0, 1.0, 1.0, 0.10))
    public static let input = SDColor(
        light: .init(0.8982, 0.8982, 0.8982), dark: .init(1.0, 1.0, 1.0, 0.15))
    public static let ring = SDColor(
        light: .init(0.6302, 0.6302, 0.6302), dark: .init(0.4515, 0.4515, 0.4515))
    /// Subtle inset surface (`base-200`).
    public static let surfaceSubtle = SDColor(
        light: .init(0.9606, 0.9606, 0.9606), dark: .init(0.0905, 0.0905, 0.0905))

    // Status colors - the only non-neutral accents; they always mean status.
    public static let info = SDColor(
        light: .init(0.2265, 0.5046, 0.9651), dark: .init(0.2994, 0.6017, 0.9733))
    public static let infoForeground = SDColor(
        light: .init(0.9803, 0.9803, 0.9803), dark: .init(0.0394, 0.0394, 0.0394))
    public static let success = SDColor(
        light: .init(0.2271, 0.658, 0.3581), dark: .init(0.2773, 0.7196, 0.4667))
    public static let successForeground = infoForeground
    public static let warning = SDColor(
        light: .init(0.9491, 0.6513, 0.095), dark: .init(0.9403, 0.6958, 0.2067))
    public static let warningForeground = SDColor(
        light: .init(0.0905, 0.0905, 0.0905), dark: .init(0.0394, 0.0394, 0.0394))
}

extension Color {
    public static var sdBackground: Color { SDColors.background.color }
    public static var sdForeground: Color { SDColors.foreground.color }
    public static var sdCard: Color { SDColors.card.color }
    public static var sdCardForeground: Color { SDColors.cardForeground.color }
    public static var sdPopover: Color { SDColors.popover.color }
    public static var sdPopoverForeground: Color { SDColors.popoverForeground.color }
    public static var sdPrimary: Color { SDColors.primary.color }
    public static var sdPrimaryForeground: Color { SDColors.primaryForeground.color }
    public static var sdSecondary: Color { SDColors.secondary.color }
    public static var sdSecondaryForeground: Color { SDColors.secondaryForeground.color }
    public static var sdMuted: Color { SDColors.muted.color }
    public static var sdMutedForeground: Color { SDColors.mutedForeground.color }
    public static var sdAccent: Color { SDColors.accent.color }
    public static var sdAccentForeground: Color { SDColors.accentForeground.color }
    public static var sdDestructive: Color { SDColors.destructive.color }
    public static var sdDestructiveForeground: Color { SDColors.destructiveForeground.color }
    public static var sdBorder: Color { SDColors.border.color }
    public static var sdInput: Color { SDColors.input.color }
    public static var sdRing: Color { SDColors.ring.color }
    public static var sdSurfaceSubtle: Color { SDColors.surfaceSubtle.color }
    public static var sdInfo: Color { SDColors.info.color }
    public static var sdSuccess: Color { SDColors.success.color }
    public static var sdWarning: Color { SDColors.warning.color }
}
