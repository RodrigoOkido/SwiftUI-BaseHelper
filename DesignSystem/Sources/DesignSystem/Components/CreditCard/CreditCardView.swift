//
//  CreditCardView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 26/06/26.
//
import SwiftUI

/// A credit card that flips in 3D on tap, revealing the back (CVV side).
/// Uses rotation3DEffect with a FlipModifier that auto-hides each face
/// at the 90° midpoint for a seamless two-sided effect.
public struct CreditCardView: View {
    
    // MARK: - Property Wrappers
    @State private var flipped = false
    @Binding private var accountNumber: String
    @Binding private var accountHolder: String
    @Binding private var expirationDate: String
    @Binding private var cvv: String
    
    // MARK: - Initializer
    public init(flipped: Bool = false,
         accountNumber: Binding<String>,
         accountHolder: Binding<String>,
         expirationDate: Binding<String>,
         cvv: Binding<String>
    ) {
        self.flipped = flipped
        self._accountNumber = accountNumber
        self._accountHolder = accountHolder
        self._expirationDate = expirationDate
        self._cvv = cvv
    }
    
    public init(flipped: Bool = false) {
        self.flipped = flipped
        self._accountNumber = .constant("4512 3456 7890 1234")
        self._accountHolder = .constant("John Doe")
        self._expirationDate = .constant("08/28")
        self._cvv = .constant("")
    }

    // MARK: - Content
    public var body: some View {
        ZStack {
            CreditCardFrontView(accountNumber: $accountNumber,
                                accountHolder: $accountHolder,
                                expirationDate: $expirationDate)
                .modifier(FlipModifier(angle: flipped ? 180 : 0))

            CreditCardBackView(cvv: $cvv)
                .modifier(FlipModifier(angle: flipped ? 0 : -180))
        }
        .animation(.spring(response: 0.95,
                           dampingFraction: 0.98),
                   value: flipped)
        .onTapGesture { flipped.toggle() }
    }
}

#Preview {
    CreditCardView(accountNumber: .constant("4512 3456 7890 1234"),
                   accountHolder: .constant("John Doe"),
                   expirationDate: .constant("08/28"),
                   cvv: .constant("123")
    )
}
