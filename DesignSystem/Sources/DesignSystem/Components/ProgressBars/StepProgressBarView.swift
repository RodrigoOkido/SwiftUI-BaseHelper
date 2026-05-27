//
//  StepProgressBarView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 27/05/26.
//

import SwiftUI

/// A single step in a step-based progress bar.
public struct StepItem {
    public let label: String
    public let color: Color

    public init(label: String, color: Color) {
        self.label = label
        self.color = color
    }
}

/// Visual style of the step-based progress bar.
public enum StepProgressStyle {
    /// Overlapping arrow shapes, each with its own configurable color.
    case arrow
    /// Horizontal line connecting circle indicators with checkmarks for completed steps.
    case indicator
}

public struct StepProgressBarView: View {

    private var items: [StepItem]
    /// Zero-based index of the current active step. Used by `.indicator`; ignored by `.arrow`.
    private var currentStep: Int
    private var style: StepProgressStyle

    public init(
        items: [StepItem],
        currentStep: Int = 0,
        style: StepProgressStyle = .arrow
    ) {
        self.items = items
        self.currentStep = currentStep
        self.style = style
    }

    public var body: some View {
        switch style {
        case .arrow:
            ArrowStepsBar(items: items)
        case .indicator:
            IndicatorStepsBar(items: items, currentStep: currentStep)
        }
    }
}

// MARK: - Preview

private let teal = Color(red: 0.22, green: 0.78, blue: 0.68)

#Preview {
    ScrollView {
        VStack(alignment: .leading, spacing: 28) {
            Group {
                Text("Arrow")
                    .font(.caption).foregroundStyle(.secondary)
                StepProgressBarView(items: [
                    StepItem(label: "Step 1", color: Color(red: 0.33, green: 0.47, blue: 0.18)),
                    StepItem(label: "Step 2", color: Color(red: 0.93, green: 0.89, blue: 0.55)),
                    StepItem(label: "Step 3", color: Color(red: 0.93, green: 0.72, blue: 0.27)),
                    StepItem(label: "Step 4", color: Color(red: 0.87, green: 0.47, blue: 0.13)),
                    StepItem(label: "Step 5", color: Color(red: 0.72, green: 0.18, blue: 0.07))
                ])
            }

            Divider()

            Group {
                Text("Indicator")
                    .font(.caption).foregroundStyle(.secondary)
                StepProgressBarView(
                    items: [
                        StepItem(label: "NAME", color: teal),
                        StepItem(label: "EMAIL", color: teal),
                        StepItem(label: "PHOTO", color: teal),
                        StepItem(label: "FINAL", color: teal)
                    ],
                    currentStep: 2,
                    style: .indicator
                )
            }
        }
        .padding()
    }
}
