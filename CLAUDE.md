# CLAUDE.md

Guidance for AI assistants (and humans) working in the **SwiftUI-BaseHelper** repository. 
SwiftUI-BaseHelper is a SwiftUI project created by Rodrigo Okido, which aims to 
explore many concepts of the Apple SwiftUI framework. Explores navigation, design system 
components, view modifiers, and so on. This document captures the architecture, 
conventions, and working agreements established so far so that new changes stay consistent 
with the existing codebase. The GitHub profile of the author is `https://github.com/RodrigoOkido/`.

---

## 1. Main Rules
1. **Mirror the existing architecture.** This project intentionally follows the
   `SwiftUI-BaseHelper` reference architecture (MVVM + Clean layering, DI,
   router-based navigation). Before adding a screen, store, or service, look at
   how an existing equivalent is built and copy that shape. Deviate only when
   there is a concrete technical reason, and call it out. 
2. **Always build before declaring done.** Compile the app and run the test
   suite (see §10). UI changes should be verified in the simulator with a
   screenshot when practical.
3. **Use the DesignSystem.** Never hardcode spacing, sizes, colors, fonts, or
   reuse ad-hoc text fields/buttons. Use the components and design tokens in the
   `DesignSystem` package (see §6). Avoid at all changing the existing package.
   If you need to create a compoonent, you can create following the pattern 
   in package.
4. **No new files unless necessary**, and never create documentation files
   unprompted.
5. **DO NOT, Never or regardless the condition** expose any private token, api token,
   keychains, or any sensitive content that might expose or harm user or developer 
   privacy and security.
   Never include in the commits, commit messages, branches without confirming with the
   developer the extreme necessity to it (in case of integrating some new API for example).
6. **DO NOT** change or edit already documented functions, computed properties, class, 
   structs or properties, unless really needed. You should ask for improvements if you feel 
   that its good and might be needed. But never change by your own.

---

## 2. Git rules
1. **Only commit when explicitly asked.** Do not run `git commit`/`git push`
   unless the user requests it.
2. **Keep comments meaningful.** Explain *why* (intent, trade-offs, non-obvious
   constraints), never narrate *what* the code obviously does.
3. **USE CRUD** on commits. (Example: Created new view. / Updated viewModel logic). Deviate from this only if its really necessary. 
4. **Provide a preview** of each commit. If many files changes included, separate in smaller commits to make each commit change more clear about its intention.

---

## 3. Project Layout

This project structure is based on the reference project (see 1. Main Rules). 
So it will contain a generic name below.

```
MyProject/
├── MyProject.xcodeproj            # objectVersion 77, file-system synchronized groups
├── DesignSystem/             # Local Swift package (NOT a remote dependency)
│   └── Sources/DesignSystem/Components, Helpers, Extensions, Fonts ...
├── MyProject/                     # App target (synchronized group — new files auto-added)
│   ├── App/                  # App bootstrap + environment + DI setup
│   ├── Core/                 # Reusable infra: Navigation, Network, Extensions, DI
│   ├── Data/                 # Network calls happens (endpoints, API, etc)
|       ├── DTO/              # API related Models. Its `Codable` and receives the data coming from API.
|       ├── Mappers/          # Model used for our end. Not related to APIs. Usually are pure classes or structs. 
|       APIRepositories.swift # Used to in call the API endpoints. Conforms some protocol located in Domain/Protocols/
│   ├── Domain/               # Model, Stores, Notifications (business data)
|       ├── Model/            # Model used for our end. Not related to APIs. Usually are pure classes or structs (clean arch). 
                              # Only with properties that matters
|       ├── Protocols/        # Model protocols. Usually used by API Repositories.
│   ├── Intents/              # App Intents / Siri shortcuts
│   └── Views/                # Feature screens, each as <Feature>View + <Feature>ViewModel
└── ReMeTests/                # XCTest unit tests (synchronized group)
```

Because the app and test targets use **`PBXFileSystemSynchronizedRootGroup`**,
new `.swift` files dropped into `MyProjectName/` or `MyProjectNameTests/` are picked up
automatically — no `project.pbxproj` edit needed for ordinary source files. The
pbxproj only needs manual editing for targets, build phases, dependencies, and
package products.

For new projects based on `SwiftUI-BaseHelper`, you can use the edit the MainView.swift 
on /Views to be generic like this:

```
struct MainView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("appLanguage") private var appLanguage: AppLanguage = .English

    // MARK: - Stored Properties
    private let appDependencies: AppDependencies
    private let myRouter: Router<DestinationView> = Router<DestinationView>()
    
    // MARK: - Initializer
    init(appDependencies: AppDependencies = AppDependencies()) {
        self.appDependencies = appDependencies
        self.appDependencies.setup()
        registerCustomFonts()
    }

    var body: some View {
        TabView {
            // Creates independent Navigation for each tab.
            // NavigationViewFactory.make(.home, router: myRouter)
                // .tabItem {
                   // Label("My View", systemImage: "rectangle.3.group.fill")
                // }
        }
        .environment(\.locale, .init(identifier: appLanguage.langCode))
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

extension MainView {
    
    /// Just use this if needed
    private func registerCustomFonts() {
        do {
            try OpenSans.registerFont()
        } catch(let error) {
            print(error)
        }
    }
}

#Preview {
    MainView()
}
```

Feel free to edit this MainView to be simpler, but remember to make generic
and simpler. The remaining Views used on the reference project, you can just 
ignore and do not replicate.

For /Data folder, you can create a mock generic file example (you can change)
this later on) of the `DTO`, `Mappers` and `Repositories`. You can use the 
SwiftUI-BaseHelper examples to follow the same pattern.

For `DTO` we should have `Remote` name before the model name. (ex: RemoteMovie.swift)
For `Mappers` the model name followed by `Mapper` (ex: MovieMapper.swift)
For `Repositories` the API name or some name that identifies better the endpoint followed by `Repository` (ex: MovieDBRepository.swift)

Make sure to make the app build after the changes. Any doubt please check SwiftUI-BaseHelper to get some context.

On /Core, if you find any API or file that looks more project related, and its not generic, you
can remove or dont replicate. But always ask before removing to make sure.

---

## 4. Architecture

- **Pattern:** MVVM over a light Clean-Architecture layering (App / Core / Data /
  Domain / Views).
- **ViewModels:** `final class`, `@Observable`. Feature view models subclass
  `BaseViewModel` when they need the shared view-state/error helpers; otherwise a
  plain `@Observable final class` is fine (e.g. `EventDetailViewModel`).
- **Dependency Injection:** `DependencyFactory` + `@Injected` / `@SafeInjected`
  property wrappers, registered in `App/AppDependencies.swift`. DI and font
  registration happen once in `ReMeApp.init()` — **never** in a `View.init`,
  which SwiftUI may call repeatedly (this previously caused `EXC_BAD_ACCESS`).
- **Navigation:** custom `Router<DestinationView>` with `NavigationViewFactory`.
  Routes are enum cases in `Core/Navigation/DestinationView.swift`; each case
  maps to a view in `makeView`. Use `router.navigate(to:)` for push and
  `router.present(view:)` for sheets. The `TabView` in `MainView` gives each tab
  its own `Router` instance (matching the reference project).
- **Shared state via Environment:** singletons like `SomeClass.shared` and the
  per-tab `Router` are injected with `.environment(...)` and read with
  `@Environment(...)`.

---

## 5. Swift / Concurrency Conventions

- Build setting `SWIFT_DEFAULT_ACTOR_ISOLATION = MainActor` — types are
  main-actor isolated by default. Keep this in mind for protocol conformances
  and tests.
- **Access control:** keep app-target types `internal` unless they must cross a
  module boundary. `DesignSystem` types that the app consumes are `public`.
  Avoid making app models `public` just to satisfy one call site — it cascades
  (this is why `Event` and `DestinationView` are deliberately `internal`).
- **File headers:** every file starts with the standard Xcode header comment
  (`//  <Name>.swift` / `//  ProjectName` / author / date).
- **Organization:** use `// MARK: -` sections (e.g. `Stored Properties`,
  `Computed Properties`, `Content`, `Subviews`, `Helpers`). Views commonly put
  subviews in a `private extension`.
- Prefer Swift's implicit-return `switch` expressions for simple mappings (see
  the enums for `title`/`color`/`iconName`).

---

## 6. DesignSystem Usage

- **Components first:** text input → `SimpleTextField` / `TextAreaField` /
  `PasswordTextField`; buttons → `CustomButton`; cards → `SimpleCardView`, etc.;
  Always check if there is some DesignSystem component that can be used before 
  creating a new one. If a new generic, reusable UI piece is needed, add it to `DesignSystem`
  (`public`), not inline in the app.
- **Design tokens** live in `DesignSystem/Helpers/DesignTokens.swift`. Use them
  instead of magic numbers: `StackSpacing`, `InsetSpacing`, `IconSize`,
  `CornerRadius`, `OpacityLevel`, `HeightSize`/`WidthSize`, `BorderWidth`.
- **Dark mode:** When creating new components in DesignSystem, always check for 
  dark mode approach. To keep consistency and readable to the user as max as possible.

---

## 7. Domain & Persistence

- (`Domain/Model`) is the core model: `Hashable`, `Identifiable`. Its where we
  separate concerns from DTO models (API-related with API property namings) from our models.
  Its created to contain only the properties that we will use in our UI or app. Ignoring 
  properties that can be ignored from the API models to build our features.
  
  Ex: If we have an `RemoteMovie` in our Data/, on Domain we will have a `Movie` struct.
  
- **Notifications:** `NotificationManager.shared` schedules up to two local
  notifications per event ("starting soon" at `start - leadTime` and "happening
  now" at start). It no-ops when `notificationsEnabled` is false.

---

## 8. App Intents / Siri

- The AppIntents metadata extractor cannot synthesize `AppEnum` conformance for
  a type defined in another module. So instead of conforming
  `DesignSystem.ReminderTag` to `AppEnum`, we keep an **app-side mirror enum**
  (`Intents/EventTag.swift`) that maps to `ReminderTag`. Follow this pattern for
  any future cross-module intent parameters.

---

## 9. Networking / API Requests

The generic network infrastructure from the reference project is kept
(`Core/Network`: `CoreNetworkProtocol`, builders, interceptors, response models,
`ResponseHandler`, `ModelMapper`). If API or endpoints necessary, you can check 
`2. Project Layout` section to get how the SwiftUI-BaseHelper does to follow the pattern.

---

## 10. Testing

- **Framework:** XCTest (matches the reference project and `DesignSystemTests`).
- **Location:** app tests in `ReMeTests/` (a unit-test target hosted by the
  `ReMe` app, so `@testable import ReMe` works). `import DesignSystem` for the
  shared enums.
- **Determinism:** never rely on the wall clock. Use `Fixtures.referenceNow` and
  pass an explicit `now:`/`referenceDate:` into the code under test
  (`HomeViewModel`, `Event.status`, etc.).
- **Isolation:** `EventStore` tests construct `EventStore(fileName:)` with a
  unique temp filename and remove it in `tearDown`; call `reset()` in `setUp`
  to start empty.
- **What to cover:** pure logic — view-model validation/transform methods,
  filtering/sorting, model `Codable`, enum tables. Don't unit-test SwiftUI view
  bodies.
- **Naming:** `test_<method>_<condition>_<expectedResult>()`.

Run the suite:

```bash
xcodebuild -project ReMe.xcodeproj -scheme ReMe \
  -destination 'platform=iOS Simulator,name=iPhone 17' test
```

Build only:

```bash
xcodebuild -project ReMe.xcodeproj -scheme ReMe -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 17' build
```

---

## 11. UI / UX Notes

- **Home dashboard** has three mutually exclusive sections — *Happening Now*
  (with an animated `LiveDot`), *Today Events*, *Future Events* — sorted
  chronologically.
- **Layout picker** (list vs. grid icons) is segmented and persisted via
  `@AppStorage("eventLayout")`. The grid/compact row shows a **non-interactive**
  ( `.allowsHitTesting(false)` ) chevron hint when more cards overflow to the
  right, detected with `onScrollGeometryChange`.
- **Filters** (`EventFilterBar`) sit between the picker and the cards: stackable
  tag chips + time chips. Selections combine as (tag OR …) AND (time OR …). When
  a filter combination matches nothing, show the "clear filters" state.
- **Empty state** (no events at all): keep the picker on top, then a centered
  icon + message + a primary `CustomButton` to add the first event. Filters are
  only shown when at least one event exists.
- **Tags** on full cards use `FlowLayout` so they wrap to new lines instead of
  overlapping; the status pill is vertically centered against the tag block.

---

## 12. Workflow Checklist

When implementing a request:

1. Read the relevant existing files; match their structure and naming.
2. Put reusable UI in `DesignSystem`; feature logic in a `ViewModel`.
3. Use design tokens and DesignSystem components — no magic numbers.
4. Add/extend XCTest coverage for new pure logic.
5. Build + run tests; fix lints introduced by your change.
6. Verify UI in the simulator (screenshot) when it changed.
7. Commit/push **only** when explicitly asked, with a concise message focused on
   the "why".
