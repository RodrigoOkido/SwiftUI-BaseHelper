//
//  PaymentFormView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 30/06/26.
//

import SwiftUI
import DesignSystem


struct PaymentFormView: View {
    
    // MARK: - Property Wrappers
    @State private var flippedCard: Bool
    @State private var accountNumber: String
    @State private var cardHolder: String
    @State private var expirationDate: String
    @State private var cvv: String
    
    // MARK: - Initializer
    init(flippedCard: Bool = false,
         accountNumber: String = "",
         cardHolder: String = "",
         expirationDate: String = "",
         cvv: String = "") {
        self.flippedCard = flippedCard
        self.accountNumber = accountNumber
        self.cardHolder = cardHolder
        self.expirationDate = expirationDate
        self.cvv = cvv
    }
    
    // MARK: - Content
    var body: some View {
        VStack(spacing: StackSpacing.xl) {
            CreditCardView(flipped: $flippedCard,
                           accountNumber: $accountNumber,
                           accountHolder: $cardHolder,
                           expirationDate: $expirationDate,
                           cvv: $cvv)
            
            VStack(alignment: .leading, spacing: StackSpacing.md) {
                RegularTextFieldView(style: .underline,
                                    fieldName: "Account Number",
                                    placeholder: "Account number",
                                    textContent: $accountNumber)
                RegularTextFieldView(style: .underline,
                                    fieldName: "Card Holder",
                                    placeholder: "Card Holder name",
                                    textContent: $cardHolder)
                RegularTextFieldView(style: .underline,
                                    fieldName: "Expiration Date",
                                    placeholder: "Date",
                                    textContent: $expirationDate) 
                RegularTextFieldView(style: .underline,
                                    fieldName: "CVV",
                                    placeholder: "CVV",
                                    textContent: $cvv) { focused in
                    flippedCard = focused ? true : false
                }
            }
        }
        .padding(.horizontal, InsetSpacing.lg)
        .navigationTitle("Payment Form")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    PaymentFormView()
}
