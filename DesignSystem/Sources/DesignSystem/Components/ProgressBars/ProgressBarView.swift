//
//  ProgressBarView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 20/05/26.
//

import SwiftUI


public enum ProgressThickness: CGFloat {
    case small = 2
    case medium = 3
    case big = 4
    case huge = 6
    case giant = 10
}

public enum ProgressStyle {
    case linear
    case circular
}

public struct ProgressBarView: View {
    
    
    @State private var progress: CGFloat
    private var progressStyle: ProgressStyle
    private var progressColor: Color
    private var progressThickness: ProgressThickness
    
    public init(progress: CGFloat,
         progressStyle: ProgressStyle = .linear,
         progressColor: Color = .green,
         progressThickness: ProgressThickness = .medium
    ) {
        self.progress = progress
        self.progressStyle = progressStyle
        self.progressColor = progressColor
        self.progressThickness = progressThickness
    }
    
    public var body: some View {
        
        switch progressStyle {
        case .linear:
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(progressColor)
                .scaleEffect(x: 1, y: progressThickness.rawValue)
        case .circular:
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: progressThickness.rawValue)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(progressColor, style: StrokeStyle(lineWidth: progressThickness.rawValue - 1, lineCap: .round))
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
    ProgressBarView(progress: 0.7)
    ProgressBarView(progress: 0.7,
                    progressStyle: .circular,
                    progressThickness: .giant)
        .frame(width: 100, height: 100)
    
}
