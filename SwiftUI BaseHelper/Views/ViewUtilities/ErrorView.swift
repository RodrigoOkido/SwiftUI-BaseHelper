//
//  ErrorView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 02/07/25.
//
import SwiftUI
import DesignSystem

struct ErrorView: View {
    
    private let errorMessage: String
    private let actionLabel: String?
    private let action: (() -> Void)?
    
    init(errorMessage: String,
         actionLabel: String? = nil,
         action: @escaping () -> Void = {}) {
        self.errorMessage = errorMessage
        self.actionLabel = actionLabel
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: StackSpacing.nano) {
            Spacer()
            Image(systemName: "exclamationmark.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
            Text(errorMessage)
                .font(.title2)
            if let actionLabel,
                let action {
                Button {
                    action()
                } label: {
                    Text(actionLabel)
                        .underline()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ErrorView(errorMessage: "Something went wrong",
              action: {})
}

#Preview {
    ErrorView(errorMessage: "Something went wrong",
              actionLabel: "Try again",
              action: {})
}
