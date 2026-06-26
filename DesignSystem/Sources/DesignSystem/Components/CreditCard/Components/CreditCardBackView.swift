//
//  CreditCardBackView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 26/06/26.
//
import SwiftUI

struct CreditCardBackView: View {
    
    // MARK: - Property Wrappers
    @Binding private var cvv: String
    
    // MARK: - Computed Properties
    private var cvvValue: String {
        cvv.isEmpty ? "• • •" : cvv
    }
    
    // MARK: - Initializer
    init(cvv: Binding<String>) {
        self._cvv = cvv
    }
    
    // MARK: - Content
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: CornerRadius.lg)
                .fill(
                    LinearGradient(
                        colors: [Color(red: 0.18, green: 0.1, blue: 0.32), Color(red: 0.12, green: 0.12, blue: 0.25)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            VStack(spacing: 0) {
                Spacer().frame(height: 28)

                Rectangle()
                    .fill(Color(red: 0.08, green: 0.08, blue: 0.12))
                    .frame(height: 46)

                Spacer().frame(height: 20)

                HStack(spacing: StackSpacing.xxs) {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: CornerRadius.nano)
                            .fill(.white.opacity(OpacityLevel.almostSolid))
                            .frame(height: 36)

                        VStack(alignment: .leading, spacing: StackSpacing.nano) {
                            ForEach(0..<4) { _ in
                                RoundedRectangle(cornerRadius: CornerRadius.quark)
                                    .fill(Color(red: 0.5, green: 0.6, blue: 0.9).opacity(0.25))
                                    .frame(height: 4)
                            }
                        }
                        .padding(.horizontal, InsetSpacing.xxs)
                        .padding(.vertical, InsetSpacing.xxs)
                    }

                    VStack(spacing: StackSpacing.nano) {
                        Text("CVV")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundStyle(.white.opacity(OpacityLevel.medium))
                        ZStack {
                            RoundedRectangle(cornerRadius: CornerRadius.xxs)
                                .fill(.white.opacity(0.12))
                                .frame(width: 54, height: 36)
                            Text(cvvValue)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.white.opacity(OpacityLevel.opaque))
                        }
                    }
                }
                .padding(.horizontal, InsetSpacing.xl)

                Spacer()

                HStack {
                    Spacer()
                    Text("SWIFT BANK")
                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white.opacity(OpacityLevel.semiTransparent))
                        .tracking(3)
                }
                .padding(.horizontal, InsetSpacing.xl)
                .padding(.bottom, InsetSpacing.lg)
            }
        }
        .frame(width: 340, height: 210)
        .shadow(color: .black.opacity(OpacityLevel.semiTransparent), radius: 24, y: 12)
    }
}

#Preview {
    VStack(spacing: 16) {
        CreditCardBackView(cvv: .constant("123"))
    }
}
