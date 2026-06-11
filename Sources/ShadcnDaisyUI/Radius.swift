import SwiftUI

/// The radius scale, derived from the web theme's `--radius: 0.625rem` (10px).
/// Always use continuous corners. Roles: `md` fields & buttons, `lg` popovers
/// and menus, `xl` cards and dialogs, capsule for pills/badges/avatars.
public enum Radius {
    /// 6pt — checkboxes, nested chips, small elements
    public static let sm: CGFloat = 6
    /// 8pt — buttons, inputs, tooltips
    public static let md: CGFloat = 8
    /// 10pt — popovers, menus, modal boxes
    public static let lg: CGFloat = 10
    /// 14pt — cards, dialogs
    public static let xl: CGFloat = 14
}

extension RoundedRectangle {
    /// A continuous-corner rounded rectangle at a token radius.
    public static func sd(_ radius: CGFloat) -> RoundedRectangle {
        RoundedRectangle(cornerRadius: radius, style: .continuous)
    }
}
