# SwiftUI-BaseHelper
Personal SwiftUI project which aims to help and demonstrate many basic concepts of Swift using the brand new declarative framework developed by Apple.

This project was developed based on **Xcode 16.4 and Swift 5**. So you can find here contents which are only available on iOS 17 or above.

All the content here is boilerplates! The only more robust thing is how navigation is implemented. We do not use NavigationLink directly in the view. 

Here you can find:
- SwiftUI 
  - Stacks (VStack / HStack / ZStack)
  - Texts (Labels)
  - TextField
  - Buttons and Actions
  - Pickers
  - Toggle
  - NavigationStack
  - Property Wrappers
  - Haptics
  - Tab bars
  
- SwiftUI Charts
- SwiftUI Lock Screen Widgets
- SwiftUI ViewModifiers
- SwiftUI AppStorage
- SwiftData
- API Requests using [MovieDB](https://www.themoviedb.org/documentation/api) (async / await)
- MapKit & Core Location
- SwiftUI Preview Macros (iOS 17)

Other Contents:
- Design System 
- Dependency Injection
- Repositories
- Network Layer
- Custom Fonts
- Unit tests
- String Catalogs (iOS 17)
- Swift Macros (upcoming)

## Minimum Requirements to run
In order to run this project properly, its important to have your XCode and iOS versions updated. Its recommended to have the following:
- Xcode 16.4
- iOS 17

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
