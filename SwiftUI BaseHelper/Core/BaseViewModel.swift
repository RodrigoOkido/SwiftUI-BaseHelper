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
    
    // MARK: - Stored Properties
    var requestFailed = false
    var viewState: ViewState = .loading
    
    
    // MARK: - Helpers
    public func errorMessage(from error: Error) -> String {
        if let requestError = error as? RequestError {
            return requestError.errorMessage ?? "Unknown error"
        }
        return error.localizedDescription
    }
}
