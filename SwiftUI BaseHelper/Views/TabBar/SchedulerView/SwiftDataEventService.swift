//
//  SwiftDataEventService.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 13/05/25.
//
import SwiftData

class SwiftDataEventService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataEventService()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Event.self,
                                                  configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        self.modelContext = modelContainer.mainContext
    }
    
    func fetchEvents() -> [Event] {
        do {
            return try modelContext.fetch(FetchDescriptor<Event>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addEvent(_ event: Event) {
        modelContext.insert(event)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
