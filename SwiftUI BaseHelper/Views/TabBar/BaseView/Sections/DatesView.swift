//
//  DatesView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 30/07/24.
//

import SwiftUI
import DesignSystem

struct DatesView: View {

    // localDateType3 - dd/MM/yyyy
    let localDateType3: String = "01/02/2016"
    // regular - yyyy-MM-dd'T'HH:mm:ssZZZ
    let regularDate: String = "2022-12-14T04:30:00+05:30"
    // isoDateTimeMilliSec - yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ
    let isoDateTimeMilliSec: String = "2022-12-14T04:30:00.1234567+0000"
    // birthDateFormat - yyyy-MM-dd'T'HH:mm:ss
    let birthDateFormat: String = "1990-05-15T00:00:00"
    // localDate - yyyy-MM-dd
    let localDate: String = "2022-12-14"
    // localDateType2 - yyyy/MM/dd
    let localDateType2: String = "2022/12/14"
    // isoDate - yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
    let isoDate: String = "2022-12-14T04:30:00.000Z"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: StackSpacing.sm) {
                Text("Handling Date formats")
                    .font(.title2)
                Text("Converting String date into Date Object")

                VStack(alignment: .leading, spacing: StackSpacing.quarck) {

                    // localDateType3
                    Text("Format - dd/MM/yyyy")
                        .font(.headline)
                    Text("Input: \(localDateType3)")
                    Text("Date Output: \(localDateType3.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)

                    // regular
                    Text("Format - yyyy-MM-dd'T'HH:mm:ssZZZ")
                        .font(.headline)
                    Text("Input: \(regularDate)")
                    Text("Date Output: \(regularDate.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)

                    // isoDateTimeMilliSec
                    Text("Format - yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ")
                        .font(.headline)
                    Text("Input: \(isoDateTimeMilliSec)")
                    Text("Date Output: \(isoDateTimeMilliSec.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)

                    // birthDateFormat
                    Text("Format - yyyy-MM-dd'T'HH:mm:ss")
                        .font(.headline)
                    Text("Input: \(birthDateFormat)")
                    Text("Date Output: \(birthDateFormat.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)

                    // localDate
                    Text("Format - yyyy-MM-dd")
                        .font(.headline)
                    Text("Input: \(localDate)")
                    Text("Date Output: \(localDate.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)

                    // localDateType2
                    Text("Format - yyyy/MM/dd")
                        .font(.headline)
                    Text("Input: \(localDateType2)")
                    Text("Date Output: \(localDateType2.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)

                    // isoDate
                    Text("Format - yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                        .font(.headline)
                    Text("Input: \(isoDate)")
                    Text("Date Output: \(isoDate.asUTCDate?.description ?? "nil")")
                        .padding(.bottom, StackSpacing.sm)
                }
            }
            .padding()
            .navigationTitle("Dates Handlers")
        }
    }
}
