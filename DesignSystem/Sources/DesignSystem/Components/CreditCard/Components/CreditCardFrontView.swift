//
//  CreditCardFrontView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 26/06/26.
//
import SwiftUI

struct CreditCardFrontView: View {
    
    // MARK: - Property Wrappers
    @Binding private var accountNumber: String
    @Binding private var accountHolder: String
    @Binding private var expirationDate: String

    // MARK: - Initializer
    init(accountNumber: Binding<String>,
         accountHolder: Binding<String>,
         expirationDate: Binding<String>
    ) {
        self._accountNumber = accountNumber
        self._accountHolder = accountHolder
        self._expirationDate = expirationDate
    }
    
    // MARK: - Content
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [Color(red: 0.13, green: 0.13, blue: 0.28), Color(red: 0.25, green: 0.1, blue: 0.45)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            Circle()
                .fill(.white.opacity(0.06))
                .frame(width: 220, height: 220)
                .offset(x: 160, y: -60)

            Circle()
                .fill(.white.opacity(0.04))
                .frame(width: 160, height: 160)
                .offset(x: -40, y: 120)

            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(
                            LinearGradient(
                                colors: [Color(red: 0.85, green: 0.72, blue: 0.35), Color(red: 0.95, green: 0.85, blue: 0.55)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 42, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.yellow.opacity(0.4), lineWidth: 0.5)
                        )

                    Spacer()

                    HStack(spacing: -10) {
                        Circle()
                            .fill(Color.red.opacity(0.85))
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.orange.opacity(0.85))
                            .frame(width: 30, height: 30)
                    }
                }

                Spacer()

                Text(accountNumber.isEmpty ? "1234  5678  9012  3456" : accountNumber)
                    .font(.system(size: 17, weight: .medium, design: .monospaced))
                    .foregroundStyle(.white.opacity(0.9))
                    .tracking(2)

                Spacer().frame(height: 18)

                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 3) {
                        Text("CARD HOLDER")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundStyle(.white.opacity(0.5))
                        Text(accountHolder.isEmpty ? "John Appleseed" : accountHolder)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.white.opacity(0.9))
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 3) {
                        Text("EXPIRES")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundStyle(.white.opacity(0.5))
                        Text(expirationDate.isEmpty ? "01 / 32" : expirationDate)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.white.opacity(0.9))
                    }
                }
            }
            .padding(InsetSpacing.xl)
        }
        .frame(width: 340, height: 210)
        .aspectRatio(contentMode: .fit)
        .shadow(color: .black.opacity(0.35), radius: 24, y: 12)
    }
}

