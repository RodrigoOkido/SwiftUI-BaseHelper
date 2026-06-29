//
//  OTPTextFieldView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 29/06/26.
//
import SwiftUI
import Combine

public struct OTPTextFieldView: View {
    
    public enum OtpSize: Int {
        case fourDigits = 4
        case sixDigits = 6
    }
    
    // MARK: Property Wrappers
    @State private var otpCode: [String]
    @FocusState private var fieldFocus: Int?
    
    // MARK: - Private Properties
    private var otpSize: OtpSize
    
    // MARK: - Initializer
    public init(otpSize: OtpSize,
                optCode: [String]) {
        self.otpSize = otpSize
        self.otpCode = Array(repeating: "", count: otpSize.rawValue)
        self.fieldFocus = 0
    }
    
    // MARK: Content
    public var body: some View {
        HStack(spacing: StackSpacing.xs) {
            ForEach(0..<otpSize.rawValue, id: \.self) { index in
                OTPTextField(text: $otpCode[index],
                             isFocused: fieldFocus == index)
                    .focused($fieldFocus, equals: index)
                    .onChange(of: otpCode[index]) { oldValue, newValue in
                        if newValue.count > 0 && index < 3 {
                            fieldFocus = index + 1
                        } else if newValue.isEmpty && oldValue.count > 0 && index > 0 {
                            fieldFocus = index - 1
                        }
                    }
            }
        }
    }
}

struct OTPTextField: View {
  @Binding var text: String
  var isFocused: Bool
  
  var body: some View {
      ZStack {
          RoundedRectangle(cornerRadius: CornerRadius.sm)
              .stroke(isFocused ? Color.blue : Color.gray.opacity(OpacityLevel.semiTransparent), lineWidth: 2)
              .frame(width: 45, height: 60)
          
          TextField("", text: $text)
              .keyboardType(.numberPad)
              .multilineTextAlignment(.center)
              .font(.title2.bold())
              .foregroundColor(.primary)
              .frame(width: 45, height: 60)
              .onReceive(Just(text)) { _ in
                  if text.count > 1 {
                      text = String(text.prefix(1))
                  }
              }
      }
  }
}

#Preview {
    OTPTextFieldView(otpSize: .sixDigits, optCode: [])
}
