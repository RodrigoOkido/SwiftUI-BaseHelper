//
//  ProgressBarsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 20/05/26.
//
import SwiftUI
import DesignSystem

struct ProgressBarsView: View {

    private let teal = Color(red: 0.22, green: 0.78, blue: 0.68)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {

                sectionHeader("Linear")
                ProgressBarView(progress: 0.7)
                ProgressBarView(progress: 0.4, statusColor: .orange, thickness: .huge)

                Divider()

                sectionHeader("Circular")
                HStack(spacing: 24) {
                    ProgressBarView(progress: 0.7, style: .circular, statusColor: teal, thickness: .giant)
                        .frame(width: 80, height: 80)
                    ProgressBarView(progress: 0.4, style: .circular, statusColor: .orange, thickness: .giant)
                        .frame(width: 80, height: 80)
                }

                Divider()

                sectionHeader("Arrow Steps")
                StepProgressBarView(items: [
                    StepItem(label: "Step 1", color: Color(red: 0.33, green: 0.47, blue: 0.18)),
                    StepItem(label: "Step 2", color: Color(red: 0.93, green: 0.89, blue: 0.55)),
                    StepItem(label: "Step 3", color: Color(red: 0.93, green: 0.72, blue: 0.27)),
                    StepItem(label: "Step 4", color: Color(red: 0.87, green: 0.47, blue: 0.13)),
                    StepItem(label: "Step 5", color: Color(red: 0.72, green: 0.18, blue: 0.07))
                ])

                Divider()

                sectionHeader("Indicator Steps")
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
            .padding()
        }
        .navigationTitle("Progress Bars")
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
    NavigationStack {
        ProgressBarsView()
    }
}
