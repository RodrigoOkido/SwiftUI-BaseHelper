//
//  SchedulerViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 13/05/25.
//
import SwiftUI
import SwiftData

@Observable
class SchedulerViewModel: BaseViewModel {
    
    // MARK: - Private Properties
    private let dataSource: SwiftDataEventService
    
    // MARK: - Public Properties
    var events: [Event]
        
    // MARK: - Initializer
    init(dataSource: SwiftDataEventService) {
        self.dataSource = dataSource
        events = dataSource.fetchEvents()
    }
}

// MARK: - Public Methods
extension SchedulerViewModel {
    
    func addSampleEvent() {
        let event = Event(id: UUID(), name: "Sample Event", date: .now, eventDescription: "My description")
        dataSource.addEvent(event)
        events = dataSource.fetchEvents()
    }
}
