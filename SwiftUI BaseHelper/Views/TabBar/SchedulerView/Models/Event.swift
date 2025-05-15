//
//  Event.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 13/05/25.
//
import SwiftData
import Foundation

// This model will be used on SwiftDataEventService.
// We will use this to show how we can fetch data using a service layer.
// Without using directly through View.
@Model
class Event {
    
    @Attribute(.unique) var id: UUID
    var name: String
    var date: Date
    var eventDescription: String
    
    init(id: UUID,
         name: String,
         date: Date,
         eventDescription: String) {
        self.id = id
        self.name = name
        self.date = date
        self.eventDescription = eventDescription
    }
}
