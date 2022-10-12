//
//  GraphicsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import Charts

struct ChartsView: View {
    
    private var data: [Income] = [
        .init(month: Month.january.rawValue, income: 300.00, color: "Purple"),
        .init(month: Month.may.rawValue, income: 800.00, color: "Gray"),
        .init(month: Month.july.rawValue, income: 680.00, color: "Green"),
        .init(month: Month.august.rawValue, income: 440.00, color: "Yellow"),
        .init(month: Month.october.rawValue, income: 100.00, color: "Red"),
        .init(month: Month.december.rawValue, income: 1500.00, color: "Black")
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
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
