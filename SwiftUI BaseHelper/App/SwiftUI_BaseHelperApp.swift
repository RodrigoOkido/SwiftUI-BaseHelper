//
//  SwiftUI_BaseHelperApp.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_BaseHelperApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [Event.self])
    }
}
