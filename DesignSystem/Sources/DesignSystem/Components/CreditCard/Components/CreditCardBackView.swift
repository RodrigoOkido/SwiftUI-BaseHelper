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
    
    // MARK: - Initializer
    init(cvv: Binding<String>) {
        self._cvv = cvv
    }
    
    // MARK: - Content
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
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

                HStack(spacing: 10) {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.white.opacity(0.9))
                            .frame(height: 36)

                        VStack(alignment: .leading, spacing: 4) {
                            ForEach(0..<4) { _ in
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color(red: 0.5, green: 0.6, blue: 0.9).opacity(0.25))
                                    .frame(height: 4)
                            }
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                    }

                    VStack(spacing: 3) {
                        Text("CVV")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundStyle(.white.opacity(0.5))
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(.white.opacity(0.12))
                                .frame(width: 54, height: 36)
                            Text(cvv.isEmpty ? "• • •" : cvv)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.white.opacity(0.85))
                        }
                    }
                }
                .padding(.horizontal, 24)

                Spacer()

                HStack {
                    Spacer()
                    Text("SWIFT BANK")
                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.35))
                        .tracking(3)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
        }
        .frame(width: 340, height: 210)
        .shadow(color: .black.opacity(0.35), radius: 24, y: 12)
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [.mint.opacity(0.3), .teal.opacity(0.3)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        VStack(spacing: 16) {
            CreditCardView(accountNumber: .constant("4512 3456 7890 1234"),
                           accountHolder: .constant("John Doe"),
                           expirationDate: .constant("08/28"),
                           cvv: .constant("123")
            )
            Text("Tap to flip")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}
