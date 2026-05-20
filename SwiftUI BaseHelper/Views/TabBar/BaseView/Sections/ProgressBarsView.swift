//
//  ProgressBarsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 20/05/26.
//
import SwiftUI
import DesignSystem

struct ProgressBarsView: View {
    
    var body: some View {
        VStack {
            ProgressBarView(progress: 0.7)
            ProgressBarView(progress: 0.7,
                            progressStyle: .circular,
                            progressThickness: .giant)
            .frame(width: 100, height: 100)
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
