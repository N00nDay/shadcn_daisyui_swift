import Foundation

/// Access to the bundled design guidelines (the same `design-guidelines.md`
/// served by the shadcn_daisyui docs site). AI agents working in a consuming
/// Xcode project should read this file — see AGENTS.md in this package.
public enum Guidelines {
    /// URL of the bundled design-guidelines.md.
    public static var url: URL? {
        Bundle.module.url(forResource: "design-guidelines", withExtension: "md")
    }

    /// The full guidelines markdown.
    public static func markdown() throws -> String {
        guard let url else {
            throw CocoaError(.fileNoSuchFile)
        }
        return try String(contentsOf: url, encoding: .utf8)
    }
}
