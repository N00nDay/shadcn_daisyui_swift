import Foundation

/// The 4pt spacing grid. Only these steps are used - if a layout seems to need
/// 10pt or 18pt, pick the nearest step. Mirrors the web's blessed Tailwind
/// steps (`gap-1/2/3/4/6/8/12`).
public enum Spacing {
    /// 4pt - hairline separation
    public static let s1: CGFloat = 4
    /// 8pt - icon↔label, controls in a cluster
    public static let s2: CGFloat = 8
    /// 12pt - tight block separation
    public static let s3: CGFloat = 12
    /// 16pt - form fields stacked; default screen margins
    public static let s4: CGFloat = 16
    /// 24pt - card interior, page sections
    public static let s6: CGFloat = 24
    /// 32pt - generous section separation
    public static let s8: CGFloat = 32
    /// 48pt - major page regions
    public static let s12: CGFloat = 48

    /// All steps in order, for iteration/validation.
    public static let all: [CGFloat] = [s1, s2, s3, s4, s6, s8, s12]
}
