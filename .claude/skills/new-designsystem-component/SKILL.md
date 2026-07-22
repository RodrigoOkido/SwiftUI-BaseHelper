---
name: new-designsystem-component
description: Add a new reusable, public UI component to the DesignSystem Swift package for SwiftUI BaseHelper — tokenized, accessible, and dark-mode aware. Use when a needed UI piece is not covered by an existing DesignSystem component.
---

# New DesignSystem Component

Add a `public` SwiftUI component to the DesignSystem package, matching the real conventions in
this repo. Follow the reference file below.

## Reference files (read these, mirror their shape)

- Component: `DesignSystem/Sources/DesignSystem/Components/Cards/SimpleCardView.swift`
- Design tokens: `DesignSystem/Sources/DesignSystem/Helpers/DesignTokens.swift`
- Theming extensions: `DesignSystem/Sources/DesignSystem/Extensions/` (`Color+`, `Font+`)

## Procedure

1. **Check for an existing component first** — do not create a duplicate. Browse Components/ and only create a new one if nothing there matches the requested behavior or UI (CLAUDE.md §7). If the design differs from what we already have, you can create a new one following the pattern. For example, if a new type of Textfield is desired, create this new type under Components/Textfields.

2. **Create** `DesignSystem/Sources/DesignSystem/Components/<Category>/<Name>.swift`. As a Swift
   package, files are picked up automatically — no project edit needed.

3. **Structure** (mirror `SimpleCardView`): `public struct <Name>: View` with a doc comment that
   includes a `Usage example:` code block, documented `private let` stored props, a
   `public init(...)` with sensible defaults, `// MARK: -` sections (Private Properties →
   Initializer → Content), a `public var body`, and a `#Preview`.

4. **Use design tokens** from `DesignTokens.swift` — never hardcode numbers: `StackSpacing`,
   `InlineSpacing`, `InsetSpacing`, `CornerRadius`, `IconSize`, `WidthSize`/`HeightSize`,
   `OpacityLevel`, `BorderWidth`.

5. **Dark mode (required by CLAUDE.md §7).** Do **not** copy `SimpleCardView`'s hardcoded
   `.black`/`.white` — that is an existing inconsistency. Instead adapt to the color scheme via
   `@Environment(\.colorScheme)` and/or the package's `Color+`/`Font+` extensions so the component
   reads well in both light and dark.

6. **Accessibility** — add `.accessibilityLabel` / `.accessibilityValue` / `.accessibilityAddTraits`
   as `SimpleCardView` does.

7. **Additive only** — do **not** edit existing documented DesignSystem code (CLAUDE.md §2/§7).

8. *(Optional)* add a matching test under `DesignSystem/Tests/` using Swift `Testing`
   (`@Suite`/`@Test`/`#expect`).

9. **Build to verify** (from the package root):
   ```bash
   cd DesignSystem && swift build
   ```

## Scaffold

> A starting point to adapt, not required output. Keep the conventions (doc comment, MARK order,
> design tokens, dark mode, accessibility, `#Preview`); change everything else — names, props,
> init signature, body — to fit the component.

```swift
//
//  <Name>.swift
//  DesignSystem
//
//  Created by <Author> on <Date>.
//
import SwiftUI

/// <One-line description of what this component shows and when to use it.>
///
/// Usage example:
/// ```swift
///     <Name>(title: "Sample")
/// ```
public struct <Name>: View {

    // MARK: - Property Wrappers
    @Environment(\.colorScheme) private var colorScheme

    // MARK: - Private Properties

    /// <Describe this property.>
    private let title: String

    /// <Optional tap action.>
    private let action: (() -> Void)?

    // MARK: - Computed Properties
    private var foreground: Color {
        colorScheme == .dark ? .white : .black
    }

    // MARK: - Initializer
    public init(title: String,
                action: (() -> Void)? = nil) {
        self.title = title
        self.action = action
    }

    // MARK: - Content
    public var body: some View {
        VStack(alignment: .leading, spacing: StackSpacing.nano) {
            Text(title)
                .foregroundStyle(foreground)
                .accessibilityLabel(title)
                .accessibilityAddTraits(.isStaticText)
        }
        .padding(InsetSpacing.md)
        .cornerRadius(CornerRadius.sm)
        .onTapGesture { action?() }
        .accessibilityLabel("<Name>")
    }
}

#Preview {
    <Name>(title: "Sample", action: {})
}
```
