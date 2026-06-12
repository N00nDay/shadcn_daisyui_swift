import SwiftUI

/// The six-role type ramp, mapped to SF text styles so Dynamic Type scales
/// everything. Never pin `Font.system(size:)` for body content.
///
/// | Role        | Web                  | iOS                    |
/// |-------------|----------------------|------------------------|
/// | pageTitle   | text-3xl bold        | Large Title, bold      |
/// | title       | text-xl semibold     | Title 3, semibold      |
/// | subtitle    | text-lg medium       | Headline (semibold)    |
/// | body        | text-base            | Body                   |
/// | control     | text-sm              | Subheadline            |
/// | label       | text-xs medium       | Footnote, medium       |
extension Font {
    /// Page title - one per screen.
    public static let sdPageTitle: Font = .largeTitle.weight(.bold)
    /// Section title.
    public static let sdTitle: Font = .title3.weight(.semibold)
    /// Subtitle / card title.
    public static let sdSubtitle: Font = .headline
    /// Body / prose.
    public static let sdBody: Font = .body
    /// UI controls and dense content - the system-wide control size.
    public static let sdControl: Font = .subheadline
    /// Labels and captions - the floor; never body text.
    public static let sdLabel: Font = .footnote.weight(.medium)
}
