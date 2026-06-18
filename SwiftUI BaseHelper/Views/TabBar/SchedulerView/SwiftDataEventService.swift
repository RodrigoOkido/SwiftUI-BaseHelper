//
//  SwiftDataEventService.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 13/05/25.
//
import SwiftData

class SwiftDataEventService {
    
    // MARK: - Private Properties
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    // MARK: - Public Properties
    @MainActor
    static let shared = SwiftDataEventService()
    
    // MARK: - Initializer
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Event.self,
                                                  configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        self.modelContext = modelContainer.mainContext
    }
    
    // MARK: - Public Methods
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
