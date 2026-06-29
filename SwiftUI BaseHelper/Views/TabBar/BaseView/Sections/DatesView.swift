//
//  DatesView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 30/07/24.
//

import SwiftUI
import DesignSystem

struct DatesView: View {
    
    // MARK: - Private Properties
    // localDateType3 - dd/MM/yyyy
    private let localDateType3: String = "01/02/2016"
    // regular - yyyy-MM-dd'T'HH:mm:ssZZZ
    private let regularDate: String = "2022-12-14T04:30:00+05:30"
    // isoDateTimeMilliSec - yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ
    private let isoDateTimeMilliSec: String = "2022-12-14T04:30:00.1234567+0000"
    // birthDateFormat - yyyy-MM-dd'T'HH:mm:ss
    private let birthDateFormat: String = "1990-05-15T00:00:00"
    // localDate - yyyy-MM-dd
    private let localDate: String = "2022-12-14"
    // localDateType2 - yyyy/MM/dd
    private let localDateType2: String = "2022/12/14"
    // isoDate - yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
    private let isoDate: String = "2022-12-14T04:30:00.000Z"

    // MARK: - Content
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: StackSpacing.micro) {
                Text("Handling Date formats")
                    .textStyle(.subtitle)
                Text("Converting String date into Date Object")
                    .padding(.bottom, StackSpacing.md)

                VStack(alignment: .leading, spacing: StackSpacing.micro) {

                    // localDateType3
                    sectionHeader("Format - dd/MM/yyyy")
                    Text("Input: \(localDateType3)")
                    Text("Date Output: \(localDateType3.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)
                    Divider()

                    // regular
                    sectionHeader("Format - yyyy-MM-dd'T'HH:mm:ssZZZ")
                    Text("Input: \(regularDate)")
                    Text("Date Output: \(regularDate.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)
                    Divider()

                    // isoDateTimeMilliSec
                    sectionHeader("Format - yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ")
                    Text("Input: \(isoDateTimeMilliSec)")
                    Text("Date Output: \(isoDateTimeMilliSec.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)
                    Divider()

                    // birthDateFormat
                    sectionHeader("Format - yyyy-MM-dd'T'HH:mm:ss")
                    Text("Input: \(birthDateFormat)")
                    Text("Date Output: \(birthDateFormat.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)
                    Divider()

                    // localDate
                    sectionHeader("Format - yyyy-MM-dd")
                    Text("Input: \(localDate)")
                    Text("Date Output: \(localDate.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)
                    Divider()

                    // localDateType2
                    sectionHeader("Format - yyyy/MM/dd")
                    Text("Input: \(localDateType2)")
                    Text("Date Output: \(localDateType2.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)
                    Divider()
                    // isoDate
                    sectionHeader("Format - yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                        
                    Text("Input: \(isoDate)")
                    Text("Date Output: \(isoDate.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(InsetSpacing.md)
            .navigationTitle("Dates Handlers")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    @ViewBuilder
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .textCase(.uppercase)
    }
}

#Preview {
    DatesView()
}
