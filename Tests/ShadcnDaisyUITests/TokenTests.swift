import XCTest

@testable import ShadcnDaisyUI

/// Tokens mirror the shadcn_daisyui web theme. The expected values here come
/// from TOKENS.md (the OKLCH → sRGB traceability table) - if the web theme
/// changes, update TOKENS.md first, then these constants.
final class TokenTests: XCTestCase {
    func testSpacingIsTheBlessedGrid() {
        XCTAssertEqual(Spacing.all, [4, 8, 12, 16, 24, 32, 48])
    }

    func testRadiusScaleMatchesTheme() {
        XCTAssertEqual(Radius.sm, 6)
        XCTAssertEqual(Radius.md, 8)
        XCTAssertEqual(Radius.lg, 10)
        XCTAssertEqual(Radius.xl, 14)
    }

    func testMotionDurations() {
        XCTAssertEqual(Motion.microDuration, 0.15)
        XCTAssertEqual(Motion.surfaceDuration, 0.18)
        XCTAssertEqual(Motion.sheetDuration, 0.30)
    }

    func testElevationLadder() {
        XCTAssertEqual(Elevation.xs.opacity, 0.05)
        XCTAssertEqual(Elevation.sm.opacity, 0.10)
    }

    func testCoreColorComponents() {
        XCTAssertEqual(SDColors.background.light, .init(1.0, 1.0, 1.0))
        XCTAssertEqual(SDColors.background.dark, .init(0.0394, 0.0394, 0.0394))
        XCTAssertEqual(SDColors.primary.light, .init(0.0905, 0.0905, 0.0905))
        XCTAssertEqual(SDColors.primary.dark, .init(0.8982, 0.8982, 0.8982))
        XCTAssertEqual(SDColors.mutedForeground.light, .init(0.4515, 0.4515, 0.4515))
        XCTAssertEqual(SDColors.destructive.light, .init(0.9065, 0.0, 0.0422))
        XCTAssertEqual(SDColors.border.dark, .init(1.0, 1.0, 1.0, 0.10))
        XCTAssertEqual(SDColors.input.dark, .init(1.0, 1.0, 1.0, 0.15))
    }

    func testForegroundPairsAreConsistent() {
        // Light surfaces carry dark text and vice versa - a cheap contrast sanity check.
        XCTAssertLessThan(SDColors.foreground.light.red, 0.2)
        XCTAssertGreaterThan(SDColors.foreground.dark.red, 0.9)
        XCTAssertGreaterThan(SDColors.primaryForeground.light.red, 0.9)
        XCTAssertLessThan(SDColors.primaryForeground.dark.red, 0.2)
    }

    func testBundledGuidelinesArePresent() throws {
        let md = try Guidelines.markdown()
        XCTAssertTrue(md.contains("# shadcn_daisyui - platforms"))
        XCTAssertTrue(md.contains("# shadcn_daisyui - spacing"))
        XCTAssertTrue(md.contains("# shadcn_daisyui - motion"))
    }
}
