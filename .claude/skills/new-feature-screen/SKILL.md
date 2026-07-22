---
name: new-feature-screen
description: Scaffold a new feature screen (View + ViewModel) in the SwiftUI BaseHelper app following the BaseViewModel/viewState pattern, and register its navigation route in DestinationView. Use when adding a new screen, tab, pushed view, or presented sheet.
---

# New Feature Screen

Scaffold a `<Feature>View` + optional `<Feature>ViewModel` pair and wire its route, matching the
real conventions in this repo. Follow the actual reference files below — CLAUDE.md's examples use
stale names (`ReMe`/`MyProject`) that do not exist here.

## Reference files (read these, mirror their shape)

- ViewModel: `SwiftUI BaseHelper/Views/TabBar/APIView/Views/ApiView/APIViewModel.swift`
- View: `SwiftUI BaseHelper/Views/TabBar/APIView/Views/ApiView/APIView.swift`
- Base class: `SwiftUI BaseHelper/Core/BaseViewModel.swift`
- Route enum: `SwiftUI BaseHelper/Core/Navigation/DestinationView.swift`
- Loading/error views: `SwiftUI BaseHelper/Views/ViewUtilities/`

## Procedure

1. **Decide: does the screen need a ViewModel?** Many screens under `Views/TabBar/*` are static
   demo/view-only screens with no ViewModel. Add a ViewModel **only** when the screen has async
   work, network calls, or non-trivial state. For a static screen, create just the View (skip
   step 2, and its `body` returns content directly instead of switching on `viewState`).

2. **Create the folder** `SwiftUI BaseHelper/Views/TabBar/<Feature>/`. The app target is a
   file-system–synchronized group, so new files auto-add to the project — do **not** edit the
   `.xcodeproj`.

3. **`<Feature>ViewModel.swift`** — `@Observable class <Feature>ViewModel: BaseViewModel`.
   Inject dependencies via protocol with production defaults in `init`. Put async work in a
   `// MARK: - Public Methods` **extension** that drives `viewState`. Do **not** redefine
   `viewState`, `ViewState`, or `getRequestErrorMessage(from:)` — they live in `BaseViewModel`.

4. **`<Feature>View.swift`** — `struct <Feature>View: View`. Hold `@State private var viewModel`,
   add `@Environment(Router<DestinationView>.self)` **only if it navigates**, provide
   `init(viewModel: <Feature>ViewModel = <Feature>ViewModel())`. The `body` switches on
   `viewModel.viewState` → `LoadingView()` / content / `ErrorView(...)`. Put subviews in computed
   properties or a `private extension`. End with a `#Preview`. Kick off async work with `.task`.

5. **Register the route** in `Core/Navigation/DestinationView.swift`: add an enum `case`, a
   matching entry in the `id` switch, and a mapping in the `makeView` switch. Pass a constructed
   ViewModel when the screen needs seed data (e.g. `SettingsView(viewModel: SettingsViewModel(...))`).
   Navigate with `router.navigate(to:)` (push) or `router.present(view:)` (sheet).

6. **Use DesignSystem components + design tokens** — never hardcode spacing/sizes/colors. If a
   reusable UI piece is missing, add it to the DesignSystem package (see the
   `new-designsystem-component` skill), not inline.

7. **Follow CLAUDE.md §5 conventions**: standard Xcode file header, `// MARK: -` section ordering
   (Property Wrappers → Private/Public Properties → Computed Properties → Initializer → Content →
   Methods).

8. **Build to verify**:
   ```bash
   xcodebuild -project "SwiftUI BaseHelper.xcodeproj" -scheme "SwiftUI BaseHelper" \
     -destination 'platform=iOS Simulator,name=iPhone 17' build
   ```

## Scaffold — ViewModel

> The scaffolds below are a starting point to adapt, not required output. Keep the conventions
> (`@Observable class : BaseViewModel`, `viewState` switch, MARK order, `#Preview`, DesignSystem
> tokens); change everything else — names, properties, methods — to fit the screen.

```swift
//
//  <Feature>ViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by <Author> on <Date>.
//

import Foundation
import SwiftUI

@Observable
class <Feature>ViewModel: BaseViewModel {

    // MARK: - Private Properties
    // Include only if contains some network / local call
    private var service: <Feature>RepositoryProtocol

    // MARK: - Public Properties
    // Include only if applicable
    var items: [<Model>]

    // MARK: - Initializer
    init(items: [<Model>] = [],
         service: <Feature>RepositoryProtocol = <Feature>Repository()) {
        self.items = items
        self.service = service
    }
}

// MARK: - Public Methods
extension <Feature>ViewModel {

    // Include only if contains some network / local call that changes UI state.
    func requestItems() async throws {
        viewState = .loading
        let response = await service.getItems()

        switch response {
        case .success(let data):
            items = data
            viewState = .loaded
        case .failure(let error):
            viewState = .error(error)
        }
    }
}
```

## Scaffold — View

```swift
//
//  <Feature>View.swift
//  SwiftUI BaseHelper
//
//  Created by <Author> on <Date>.
//

import SwiftUI
import DesignSystem

struct <Feature>View: View {

    // MARK: - ViewModel
    @State private var viewModel: <Feature>ViewModel

    // MARK: - Property Wrappers
    // Include only if this screen navigates:
    @Environment(Router<DestinationView>.self) var router: Router<DestinationView>

    // MARK: - Initializer
    init(viewModel: <Feature>ViewModel = <Feature>ViewModel()) {
        self.viewModel = viewModel
    }

    // MARK: - Content
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .loading:
                LoadingView()
            case .loaded:
                contentView
            case .error(let error):
                ErrorView(errorMessage: viewModel.getRequestErrorMessage(from: error),
                          action: {
                    Task { try await viewModel.requestItems() }
                })
            }
        }
        .navigationTitle("<Title>")
        .task {
            try? await viewModel.requestItems()
        }
    }
}

// MARK: - Content
private extension <Feature>View {

    var contentView: some View {
        VStack(spacing: StackSpacing.md) {
            // Build content with DesignSystem components + tokens.
        }
        .padding(InsetSpacing.md)
    }
}

#Preview {
    <Feature>View()
}
```

## Route registration snippet (in `DestinationView.swift`)

```swift
// 1. enum case
case <feature>View

// 2. in `var id: String` switch
case .<feature>View:
    return "<feature>View"

// 3. in `var makeView: some View` switch
case .<feature>View:
    <Feature>View()
```
