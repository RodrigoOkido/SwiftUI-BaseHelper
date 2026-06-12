# SwiftUI-BaseHelper
Personal SwiftUI project which aims to help and demonstrate many basic concepts of Swift using the brand new declarative framework developed by Apple.

This project was developed based on **Xcode 26.5 and Swift 6**. So you can find here contents which are only available on iOS 17 or above.

All the content here is boilerplates! The only more robust thing is how navigation is implemented. Im not using NavigationLink directly, but some pattern similar to coordinator, which is what we usually see on real world.

Here you can find:
- SwiftUI 
  - Text (Custom fonts / modifiers)
  - TextFields
  - Buttons and Actions
  - Pickers
  - Indicators
  - Selectors
  - Toggles
  - Haptics
  - Tab bars
  
- SwiftUI Charts
- SwiftUI Lock Screen Widgets
- SwiftUI ViewModifiers
- SwiftUI AppStorage
- SwiftData
- API Requests using [MovieDB](https://www.themoviedb.org/documentation/api) (async / await)
- MapKit & Core Location
- SwiftUI Preview Macros (iOS 17+)

Other Contents:
- Design System 
- Dependency Injection
- Repositories
- Network Layer
- Custom Fonts
- Unit tests
- String Catalogs (iOS 17+)

## Minimum Requirements to run
In order to run this project properly, its important to have your XCode and iOS versions updated. Its recommended to have the following:
- Xcode 26
- iOS 26

The project will request a Config.xcconfig to compile the project correctly. You can create this one by yourself with the following template:

```
// TEMP
API_URL = api.themoviedb.org/3/movie/popular?api_key=$(API_KEY)
API_URL_POSTER_IMAGE = image.tmdb.org/t/p/w500
// =======

HTTP_SCHEME = https
BASE_URL = api.themoviedb.org/
API_KEY = // https://www.themoviedb.org/
```

This config file contains the basic needs to run the API section of the app. You need an account on The Movie DB website, and create a Movie DB API key. Once created, you can just paste the API KEY in the last line "API_KEY = YOUR_KEY". And run the app again! If you dont want to create, you can just create the xcconfig file.

## What is SwiftUI?
SwiftUI is Apple's brand new framework for building user interfaces for iOS, tvOS, macOS, and watchOS. Apple introduced SwiftUI in 2019 and the 
framework has been evolving at a rapid pace ever since. Unlike UIKit and AppKit, SwiftUI is a cross-platform framework.
