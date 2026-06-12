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

/// Shows a user's position within a fixed sequence of steps.
///
/// Use `StepProgressBarView` in multi-step flows — onboarding, checkout,
/// form wizards, or any process where the user needs to know how far they
/// have come and how much is left. Each `StepItem` carries its own label
/// and accent color, giving teams full control over the visual language.
///
/// Two layouts are available:
/// - `.arrow` — overlapping chevron shapes that suit branded, high-contrast
///   flows where each step has a distinct color identity.
/// - `.indicator` — connected circles with checkmarks for completed steps,
///   a neutral pattern that works well in standard form flows.
///
/// `currentStep` is zero-indexed. Passing a value beyond the last item
/// renders all steps as completed.
///
/// Usage example:
/// ```swift
/// // Checkout flow
/// StepProgressBarView(
///     items: [
///         StepItem(label: "Cart",    color: .blue),
///         StepItem(label: "Address", color: .blue),
///         StepItem(label: "Payment", color: .blue),
///         StepItem(label: "Review",  color: .blue),
///     ],
///     currentStep: 1,
///     style: .indicator
/// )
/// ```
public struct StepProgressBarView: View {

    // MARK: - Private Properties
    
    /// List of each step within the step progress bar.
    private var items: [StepItem]
    
    /// Indicates the current step the bar is focused on or stopped.
    private var currentStep: Int
    
    /// Style of the step progress style.
    private var style: StepProgressStyle

    // MARK: - Init
    public init(
        items: [StepItem],
        currentStep: Int = 0,
        style: StepProgressStyle = .arrow
    ) {
        self.items = items
        self.currentStep = currentStep
        self.style = style
    }

    // MARK: - Content
    public var body: some View {
        switch style {
        case .arrow:
            ArrowStepsBar(items: items, currentStep: currentStep)
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
                Text("Arrow — currentStep: 2")
                    .font(.caption).foregroundStyle(.secondary)
                StepProgressBarView(
                    items: [
                        StepItem(label: "Step 1", color: Color(red: 0.33, green: 0.47, blue: 0.18)),
                        StepItem(label: "Step 2", color: Color(red: 0.93, green: 0.89, blue: 0.55)),
                        StepItem(label: "Step 3", color: Color(red: 0.93, green: 0.72, blue: 0.27)),
                        StepItem(label: "Step 4", color: Color(red: 0.87, green: 0.47, blue: 0.13)),
                        StepItem(label: "Step 5", color: Color(red: 0.72, green: 0.18, blue: 0.07))
                    ],
                    currentStep: 2
                )
            }

            Divider()

            Group {
                Text("Indicator — currentStep: 2")
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
