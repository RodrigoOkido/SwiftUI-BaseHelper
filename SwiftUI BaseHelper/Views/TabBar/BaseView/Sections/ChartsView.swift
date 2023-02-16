//
//  GraphicsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import Charts

struct ChartsView: View {
    
    // MARK: - Stored Properties
    private var data: [Income] = [
        .init(month: Month.January, income: 300.00, color: "Purple"),
        .init(month: Month.May, income: 800.00, color: "Gray"),
        .init(month: Month.July, income: 680.00, color: "Green"),
        .init(month: Month.August, income: 440.00, color: "Yellow"),
        .init(month: Month.October, income: 100.00, color: "Red"),
        .init(month: Month.December, income: 1500.00, color: "Black")
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                
                // MARK: - BAR MARK
                Text("Bar mark")
                    .bold()
                Chart {
                    ForEach(data) { item in
                        BarMark(
                            x: .value("Month", item.month),
                            y: .value("Total", item.income)
                        )
                        .foregroundStyle(by: .value("Month Color", item.color))
                    }
                }
                .chartForegroundStyleScale([
                    "Purple": .purple, "Gray": .gray, "Green": .green, "Yellow": .yellow, "Red": .red, "Black": .black
                ])
                .frame(height: 300)
                .padding()
                .padding([.bottom], 30)
                
                // MARK: - AREA MARK
                Text("Area Mark")
                    .bold()
                Chart {
                    ForEach(data) { item in
                        AreaMark(
                            x: .value("Month", item.month),
                            y: .value("Total", item.income)
                        )
                    }
                }
                .frame(height: 300)
                .padding()
                .padding([.bottom], 30)

                // MARK: - LINE MARK WITH POINT MARK
                Text("Line Mark with Point Mark")
                    .bold()
                Chart {
                    ForEach(data) { item in
                        LineMark(
                            x: .value("Month", item.month),
                            y: .value("Total", item.income)
                        )
                        PointMark(
                            x: .value("Month", item.month),
                            y: .value("Total", item.income)
                        )
                    }
                }
                .frame(height: 300)
                .padding()
                .padding([.bottom], 30)
                
                // MARK: - RECTANGLE MARK
                Text("Rectangle Mark")
                    .bold()
                Chart {
                    ForEach(data) { item in
                        RectangleMark(
                            x: .value("Month", item.month),
                            y: .value("Total", item.income)
                        )
                    }
                }
                .frame(height: 300)
                .padding()
                .padding([.bottom], 30)
                
                // MARK: - BAR MARK WITH RULE MARK
                Text("Bar mark with Rule Mark")
                    .bold()
                Chart {
                    ForEach(data) {
                        BarMark(
                            x: .value("Month", $0.month),
                            y: .value("Income", $0.income)
                        )
                    }
                    RuleMark(y: .value("Minimum ideal income", 650))
                        .foregroundStyle(.red)
                }
                .frame(height: 300)
                .padding()
                .padding([.bottom], 30)
            }
        }
        .navigationTitle("Charts")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct GraphicsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}
