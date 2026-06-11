import SwiftUI

/// Three durations, ease-out, opacity/transform only. Mirrors the web theme's
/// 150ms micro / 180ms small-surface / 300ms large-surface tiers. Prefer
/// system presentation animations for sheets and covers; respect
/// `accessibilityReduceMotion` before adding custom animation.
public enum Motion {
    /// 0.15s — micro state changes (selection, color, small reveals)
    public static let microDuration: TimeInterval = 0.15
    /// 0.18s — small surfaces entering/leaving (popovers, menus)
    public static let surfaceDuration: TimeInterval = 0.18
    /// 0.30s — large surfaces (sheets, drawers)
    public static let sheetDuration: TimeInterval = 0.30

    public static let micro: Animation = .easeOut(duration: microDuration)
    public static let surface: Animation = .easeOut(duration: surfaceDuration)
    public static let sheet: Animation = .easeOut(duration: sheetDuration)
}
