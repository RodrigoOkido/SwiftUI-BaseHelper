//
//  IndicatorStepsBar.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 27/05/26.
//

import SwiftUI

struct IndicatorStepsBar: View {
    
    // MARK: - Private Properties
    
    /// Defines the Circle size of each step.
    private let circleSize: CGFloat = 28
    
    // MARK: - Public Properties
    
    /// List of each step within the indicators step bar.
    let items: [StepItem]
    
    /// Indicates the current step the bar is focused on or stopped.
    let currentStep: Int

    // MARK: - Content
    var body: some View {
        VStack(spacing: 6) {
            // Circles row with inline connecting lines
            HStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    stepCircle(index: index, color: item.color)
                    if index < items.count - 1 {
                        Rectangle()
                            .fill(index < currentStep ? item.color : Color.gray.opacity(0.3))
                            .frame(height: 2)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            // Labels row — mirrors circles-row structure for alignment
            HStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    Text(item.label)
                        .font(.caption2)
                        .fontWeight(index == currentStep ? .semibold : .regular)
                        .foregroundStyle(index <= currentStep ? Color.primary : Color.secondary)
                        .fixedSize(horizontal: true, vertical: false)
                        .frame(width: circleSize, alignment: .center)
                    if index < items.count - 1 {
                        Spacer()
                    }
                }
            }
        }
    }

    // MARK: - Private Methods
    @ViewBuilder
    private func stepCircle(index: Int, color: Color) -> some View {
        let isCompleted = index < currentStep
        let isActive = index == currentStep

        ZStack {
            Circle()
                .fill(isCompleted ? color : .clear)
            Circle()
                .strokeBorder(
                    isCompleted || isActive ? color : Color.gray.opacity(0.4),
                    lineWidth: 2
                )
            if isCompleted {
                Image(systemName: "checkmark")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.white)
            } else {
                Text("\(index + 1)")
                    .font(.system(size: 11, weight: isActive ? .semibold : .regular))
                    .foregroundStyle(isActive ? color : Color.gray.opacity(0.55))
            }
        }
        .frame(width: circleSize, height: circleSize)
    }
}
