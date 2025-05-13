//
//  Event.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 13/05/25.
//
import SwiftData
import Foundation

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
