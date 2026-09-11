//
//  BaseViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 30/06/25.
//
import SwiftUI

@Observable
public class BaseViewModel: NSObject {
    
    enum ViewState {
        case loading
        case loaded
        case error(Error)
    }
    
    // MARK: - Public Properties
    var viewState: ViewState = .loading
    
    // MARK: - Helpers
    public func getRequestErrorMessage(from error: Error) -> String {
        switch error {
        case let error as DomainError:
            return error.message ?? "Unknown error"
        default:
            return error.localizedDescription
        }
    }
}
