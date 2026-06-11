import SwiftUI

/// The (deliberately short) elevation ladder. Surfaces are flat; 1px borders
/// do the separation work and shadows are garnish. Prefer system materials
/// for overlays. Nothing in the system casts more than `.sm`.
public enum Elevation {
    public struct ShadowToken: Sendable, Equatable {
        public let opacity: Double
        public let radius: CGFloat
        public let y: CGFloat
    }

    /// Interactive controls (web `shadow-xs`: 0 1px 2px @ 5%).
    public static let xs = ShadowToken(opacity: 0.05, radius: 1, y: 1)
    /// Cards, popovers, menus, modals (web `shadow-sm`: 0 1px 3px @ 10%).
    public static let sm = ShadowToken(opacity: 0.10, radius: 1.5, y: 1)
}

extension View {
    /// Apply an elevation token. This is the ceiling — don't compose stronger
    /// shadows.
    public func sdShadow(_ token: Elevation.ShadowToken) -> some View {
        shadow(
            color: Color.black.opacity(token.opacity),
            radius: token.radius, x: 0, y: token.y)
    }
}
