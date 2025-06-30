//
//  SchedulerView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 13/05/25.
//
import SwiftUI
import SwiftData

struct SchedulerView: View {
        
    var viewModel: SchedulerViewModel = SchedulerViewModel(dataSource: .shared)
    
    var body: some View {
        VStack {
            Text("This is a Swift Data Sample")
            ForEach(viewModel.events) { event in
                VStack {
                    HStack {
                        Text(event.name)
                        Text(event.date.getFormatted(format: .localDateType2))
                    }
                    Text(event.eventDescription)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 2)
                )
            }
            Button("Add new event sample") {
                viewModel.addSampleEvent()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .cornerRadius(8)
        }
        .navigationTitle("Scheduler View")
    }
}
