//
//  ProgressBarView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 20/05/26.
//

import SwiftUI

/// Thickness values of the progress bar. If not defined, .medium will be used
public enum ProgressThickness: CGFloat {
    case small = 2
    case medium = 3
    case big = 4
    case huge = 6
    case giant = 10
}

/// Styles of the progress bar. If not defined, .linear will be used.
public enum ProgressStyle {
    case linear
    case circular
}

public struct ProgressBarView: View {
    
    /// Progress value of the progress bar
    @State private var progress: CGFloat
    
    /// Style of the progress bar. If not defined, linear will be used.
    private var style: ProgressStyle
    
    /// Color of the progress bar.
    private var statusColor: Color
    
    /// Thickness of the progress bar.
    private var thickness: ProgressThickness
    
    public init(progress: CGFloat,
                style: ProgressStyle = .linear,
                statusColor: Color = .green,
                thickness: ProgressThickness = .medium
    ) {
        self.progress = progress
        self.style = style
        self.statusColor = statusColor
        self.thickness = thickness
    }
    
    public var body: some View {
        
        switch style {
        case .linear:
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(statusColor)
                .scaleEffect(x: 1, y: thickness.rawValue)
        case .circular:
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: thickness.rawValue)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(statusColor, style: StrokeStyle(lineWidth: thickness.rawValue - 1, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: progress)
                Text("\(Int(progress * 100))%")
                    .font(.headline)
                    .bold()
            }
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        ProgressBarView(progress: 0.7)
        ProgressBarView(progress: 0.4, statusColor: .orange, thickness: .huge)
        ProgressBarView(progress: 0.7, style: .circular, thickness: .giant)
            .frame(width: 100, height: 100)
    }
    .padding()
}
