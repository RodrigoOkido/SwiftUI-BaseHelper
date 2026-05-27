//
//  ArrowStepsBar.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 27/05/26.
//

import SwiftUI

struct ArrowStepsBar: View {
    let items: [StepItem]
    let currentStep: Int
    private let arrowDepth: CGFloat = 16

    var body: some View {
        HStack(spacing: -arrowDepth) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                let isFirst = index == 0
                let isFuture = index > currentStep

                ZStack {
                    ArrowStepShape(isFirst: isFirst)
                        .fill(isFuture ? item.color.opacity(0.3) : item.color)
                    Text(item.label)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(isFuture ? .white.opacity(0.5) : .white)
                        .shadow(color: .black.opacity(0.18), radius: 1, x: 0, y: 1)
                        .padding(.leading, isFirst ? 14 : arrowDepth + 14)
                        .padding(.trailing, arrowDepth + 10)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                }
                .frame(maxWidth: .infinity, minHeight: 44)
                .zIndex(Double(items.count - index))
            }
        }
    }
}
