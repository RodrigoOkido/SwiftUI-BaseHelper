//
//  SchedulerViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 13/05/25.
//
import SwiftUI
import SwiftData

@Observable
class SchedulerViewModel {
    
    var events: [Event]
    private let dataSource: SwiftDataEventService
        
    init(dataSource: SwiftDataEventService) {
        self.dataSource = dataSource
        events = dataSource.fetchEvents()
    }
    
    func addSampleEvent() {
        let event = Event(id: UUID(), name: "Sample Event", date: .now, eventDescription: "My description")
        dataSource.addEvent(event)
        events = dataSource.fetchEvents()
    }
}
