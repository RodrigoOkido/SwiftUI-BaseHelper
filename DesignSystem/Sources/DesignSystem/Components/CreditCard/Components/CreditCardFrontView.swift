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

    // MARK: - Computed Properties
    private var accountNumberValue: String {
        accountNumber.isEmpty ? "1234  5678  9012  3456" : accountNumber
    }
    private var accountHolderValue: String {
        accountHolder.isEmpty ? "John Appleseed" : accountHolder
    }
    private var expirationDateValue: String {
        expirationDate.isEmpty ? "01 / 32" : expirationDate
    }
    
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
            RoundedRectangle(cornerRadius: CornerRadius.lg)
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
                    RoundedRectangle(cornerRadius: CornerRadius.nano)
                        .fill(
                            LinearGradient(
                                colors: [Color(red: 0.85, green: 0.72, blue: 0.35), Color(red: 0.95, green: 0.85, blue: 0.55)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 42, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: CornerRadius.nano)
                                .stroke(.yellow.opacity(OpacityLevel.medium), lineWidth: 0.5)
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
                Text(accountNumberValue)
                    .font(.system(size: 17, weight: .medium, design: .monospaced))
                    .foregroundStyle(.white.opacity(OpacityLevel.almostSolid))
                    .tracking(2)

                Spacer().frame(height: 18)

                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: StackSpacing.nano) {
                        Text("CARD HOLDER")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundStyle(.white.opacity(OpacityLevel.medium))
                        Text(accountHolderValue)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.white.opacity(OpacityLevel.almostSolid))
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 3) {
                        Text("EXPIRES")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundStyle(.white.opacity(OpacityLevel.medium))
                        Text(expirationDateValue)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.white.opacity(OpacityLevel.almostSolid))
                    }
                }
            }
            .padding(InsetSpacing.xl)
        }
        .frame(width: 340, height: 210)
        .aspectRatio(contentMode: .fit)
        .shadow(color: .black.opacity(OpacityLevel.semiTransparent), radius: 24, y: 12)
    }
}

#Preview {
    CreditCardFrontView(accountNumber: .constant("4512 3456 7890 1234"),
                        accountHolder: .constant("John Doe"),
                        expirationDate: .constant("08/28"))
}

