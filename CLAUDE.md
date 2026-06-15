# CLAUDE.md

Guidance for AI assistants (and humans) working in the **SwiftUI-BaseHelper** repository. 
SwiftUI-BaseHelper is a SwiftUI project created by Rodrigo Okido, which aims to 
explore many concepts of the Apple SwiftUI framework. Explores navigation, design system 
components, view modifiers, and so on. This document captures the architecture, 
conventions, and working agreements established so far so that new changes stay consistent 
with the existing codebase. The GitHub profile of the author is `https://github.com/RodrigoOkido/`.

---

## 1. Main Rules
1. **Mirror the existing architecture.** (see §4 and onwards)
2. **Use the DesignSystem.** (see §7)
3. **No new files unless necessary**, and never create documentation files
   unprompted.
4. **Always build before declaring done.** Compile the app and run the test
   suite (see §11). UI changes should be verified in the simulator with a
   screenshot when practical.
5. **Always** review if you are **NOT** doing any bad practice or strict rule. (see §2)
6. **Always** ask if the task or request is a good solution to finish what was requested. 
   If agreed, you can check §3 to next steps.

---

## 2. Warnings & Strict Rules  
1. **DO NOT, Never or regardless the condition** expose any private token, api token,
   keychains, or any sensitive content that might expose or harm user or developer 
   privacy and security.
   Never include in the commits, commit messages, branches without confirming with the
   developer the extreme necessity to it (in case of integrating some new API for example).
2. **DO NOT** change or edit already documented functions, computed properties, class, 
   structs or properties, unless really needed. You should ask for improvements if you feel 
   that its good and might be needed. But never change by your own.
3. **DO NOT** do things by your own. For every step, check this doc to see if you can find some info that can guide you.

---

## 3. Git rules
1. **Only commit when explicitly asked.** Do not run `git commit`/`git push`
   unless the user requests it.
2. **Keep comments meaningful.** Explain *why* (intent, trade-offs, non-obvious
   constraints), never narrate *what* the code obviously does.
3. **USE CRUD** on commits. (Example: Created new view. / Updated viewModel logic). Deviate from this only if its really necessary. 
4. **Provide a preview** of each commit. If many files changes included, separate in smaller commits to make each commit change more clear about its intention.
5. **Try rebase** over merge to keep track of commits history.
6. **DO NOT** force push or do any force operation unless extremely necessary. If needed, 
   ask for confirmation.

---

## 4. Project Layout

This project follows the architecture (MVVM + Clean layering, DI, router-based navigation).
Before creating a screen, store, service, or component, look at how an existing equivalent 
is built and copy that shape. Deviate only when there is a concrete technical reason, and 
call it out. 

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

---

## 5. Swift / Concurrency Conventions

- **Access control:** keep app-target types `internal` unless they must cross a
  module boundary. `DesignSystem` types that the app consumes are `public`.
  Avoid making app models `public` just to satisfy one call site — it cascades
  (this is why `Event` and `DestinationView` are deliberately `internal`).
- **File headers:** every file starts with the standard Xcode header comment
  (`//  <Name>.swift` / `//  ProjectName` / author / date).
- **Organization:** use `// MARK: -` sections. Order should be the following (Priority top-down). Only add each MARK section when necessary.
  `Private Property Wrappers`
  `Public Property Wrappers`
  `Private Properties`, 
  `Public Properties`, 
  `Computed Properties`, 
  `Initializer`
  `Content`, 
  `Private Methods`, 
  `Public Methods`. 
  Views commonly put subviews in a `private extension`. You should use also `MARK: - Content` for this case too.
- Prefer Swift's implicit-return `switch` expressions for simple mappings (see
  the enums for `title`/`color`/`iconName`).
  
**You should** follow the structure of every file carefully. Keep the order of properties and functions always. You can take the guide of many files examples below.
If your file is not related to any of the files below, check if do not exist a similar file in the project where you can follow.

Swift structure example for Views:
  
```swift
struct MyView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("appLanguage") private var appLanguage: AppLanguage = .English

    // MARK: - Private Properties
    private let appDependencies: AppDependencies
    private let myRouter: Router<DestinationView> = Router<DestinationView>()
    
    // MARK: - Initializer
    init(appDependencies: AppDependencies = AppDependencies()) {
        self.appDependencies = appDependencies
        self.appDependencies.setup()
    }

    // MARK: - Content
    var body: some View {
        Text("Hello World")
    }
}

// MARK: - Content
private extension MyView {
    
    var myComponentView: some View {
        VStack {
            Text("My helper component")
        }
    }
}

// MARK: - Helpers
extension MyView {
    
    // Just use this if needed
    private func myHelperMethod() {
        // My logic
    }
}

#Preview {
    MyView()
}
```

For ViewModels example:

```swift
import Foundation

@Observable
class MyViewModel: BaseViewModel {
    
    // MARK: - Private Properties
    private var myAPIData: [Data]
    
    // MARK: - Initializer
    init(myAPIData: [Data]) {
        self.myAPIData = myAPIData
    }
    
    // MARK: - Public Methods
    @MainActor // -> Updates View use MainActor
    func requestMyData() async throws {
        viewState = .loading
        let response = await callMyAPI()
        
        switch response {
        case .success(let data):
            myAPIData = data
            viewState = .loaded
        case .failure(let error):
            viewState = .error(error)
        }
    }
}
```

For /Data folder, you can create a mock generic file example (you can change)
this later on) of the `DTO`, `Mappers` and `Repositories`. 

### DTOs example:
For `DTO` we should have `Remote` name before the model name. (ex: RemoteMovie.swift).
The example below we receive a list within `results` property, which is a json object with a list of a model coming from the API.

```swift
public struct RemoteMyAPIModelList: Codable {

    var results: [MyAPIModel]

    public init(results: [MyAPIModel]) {
        self.results = results
    }
}

public struct RemoteMyAPIModel: Codable, Hashable {

    // Properties coming from the API
    var myProperty1: String?
    var myProperty2: String?
    var myProperty3: String?
    // ...

    public init(myProperty1: String?, myProperty2: String?, myProperty3: String?) {
        self.myProperty1 = myProperty1
        self.myProperty2 = myProperty2
        self.myProperty3 = myProperty3
        // ...
    }
}
```

For `Mappers` the name should end with `Mapper` preceded by the name of the object we want to build (ex: MovieMapper.swift) .

```swift
import Foundation

public struct ApiModelMapper: ModelMapper {
    public typealias T = MyAPIModel

    public static func map<T>(_ input: some Codable) throws -> T {
        guard let input: RemoteMyAPIModel = input as? RemoteMyAPIModel else {
            throw RequestError(errorType: .couldNotMap, 
                               errorMessage: "Could not map")
        }

        let movie = MyAPIModel(myProperty1: input.myProperty1 ?? "",
                               myProperty2: input.myProperty2 ?? "",
                               myProperty3: input.myProperty3 ?? "")

        guard let result: T = movie as? T else {
            throw RequestError(errorType: .couldNotMap, 
                               errorMessage: "Could not map")
        }
        return result
    }
}

public struct ApiModelListMapper: ModelMapper {
    public typealias T = [RemoteMyAPIModel]

    public static func map<T>(_ input: some Codable) throws -> T {
        guard let apiInput: RemoteMyAPIModelList = input as? RemoteMyAPIModelList,
              let input: [RemoteMyAPIModel] = apiInput.results as? [RemoteMyAPIModel] else {
            throw RequestError(errorType: .couldNotMap,
                               errorMessage: "Could not map")
        }

        let items: [MyAPIModel] = try input.map {
            return try ApiModelMapper.map($0)
        }
        guard let result = items as? T else {
            throw RequestError(errorType: .couldNotMap, 
                               errorMessage: "Could not map")
        }
        return result
    }
}
```

For `Repositories` the API name or some name that identifies better the endpoint followed by `Repository` (ex: MovieDBRepository.swift)

```swift

public class MyAPIRepository: APIRepositoryProtocol {

    // MARK: - Private Properties
    private let network: CoreNetworkProtocol
    
    // MARK: - Initializer
    public init(network: CoreNetworkProtocol = CoreNetwork()) {
        self.network = network
    }

    func getMyDesiredData() async -> Result<[MyAPIModel], RequestError> {
        
        let requestResponse = await network.request(endpoint: MyAPIEndpoint.getData,
                                                    method: .GET,
                                                    interceptors: [MyAPIInterceptor()],
                                                    responseType: RemoteMyAPIModelList.self,
                                                    errorType:  NetworkRequestError.self)

        return ResponseHandler.handle(mapper: ApiModelListMapper(), response: requestResponse)
    }
}

```

---

## 6. Architecture

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

## 7. DesignSystem Usage
Never hardcode spacing, sizes, colors, fonts, or reuse ad-hoc text fields/buttons. 
Use the components and design tokens in the `DesignSystem` package. **DO NOT** apply
any code changes on the original code unless extremely necessary. If that happens, 
provide clear instructions about why and reasons for it. Adding new content is fine.

- **Components first:** text input → `SimpleTextField` / `TextAreaField` /
  `PasswordTextField`; buttons → `CustomButton`; cards → `SimpleCardView`, etc.;
  Always check if there is some DesignSystem component that can be used before 
  creating a new one. If a new generic, reusable UI piece is needed, add it to `DesignSystem` (`public`), not inline in the app. And follow the pattern 
  in package for this new component.
- **Design tokens** live in `DesignSystem/Helpers/DesignTokens.swift`. Use them
  instead of magic numbers: `StackSpacing`, `InsetSpacing`, `IconSize`,
  `CornerRadius`, `OpacityLevel`, `HeightSize`/`WidthSize`, `BorderWidth`.
- **Dark mode:** When creating new components in DesignSystem, always check for 
  dark mode approach. To keep consistency and readable to the user as max as possible.

---

## 8. Domain & Persistence

- (`Domain/Model`) is the core model: `Hashable`, `Identifiable`. Its where we
  separate concerns from DTO models (API-related with API property namings) from our models.
  Its created to contain only the properties that we will use in our UI or app. Ignoring 
  properties that can be ignored from the API models to build our features.
  
  Ex: If we have an `RemoteMovie` in our Data/, on Domain we will have a `Movie` struct.
  
- **Notifications:** `NotificationManager.shared` schedules up to two local
  notifications per event ("starting soon" at `start - leadTime` and "happening
  now" at start). It no-ops when `notificationsEnabled` is false.

---

## 9. App Intents / Siri

- The AppIntents metadata extractor cannot synthesize `AppEnum` conformance for
  a type defined in another module. So instead of conforming
  `DesignSystem.ReminderTag` to `AppEnum`, we keep an **app-side mirror enum**
  (`Intents/EventTag.swift`) that maps to `ReminderTag`. Follow this pattern for
  any future cross-module intent parameters.

---

## 10. Networking / API Requests

The generic network infrastructure from the reference project is kept
(`Core/Network`: `CoreNetworkProtocol`, builders, interceptors, response models,
`ResponseHandler`, `ModelMapper`). If API or endpoints necessary, you can check 
`2. Project Layout` section to get how the SwiftUI-BaseHelper does to follow the pattern.

- **Async/Await** Use always this pattern over Closures/Completions
- **AsyncImage** for loading images URLs or external images

---

## 11. Testing

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

## 11. Workflow Checklist

When implementing a request:

1. Read the relevant existing files; match their structure and naming.
2. Put reusable UI in `DesignSystem`; feature logic in a `ViewModel`.
3. Use design tokens and DesignSystem components — no magic numbers.
4. Add/extend XCTest coverage for new pure logic.
5. Build + run tests; fix lints introduced by your change.
6. Verify UI in the simulator (screenshot) when it changed.
7. Verify for any possible warnings or strict rules breaks (see §3)
8. Commit/push **only** when explicitly asked, with a concise message focused on
   the "why".
