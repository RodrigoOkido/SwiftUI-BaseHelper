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
    var viewState: ViewState = .loading
    
    // MARK: - Helpers
    public func getRequestErrorMessage(from error: Error) -> String {
        switch error {
        case is RequestError:
            let error = error as? RequestError
            return error?.errorMessage ?? "Unknown error"
        default:
            return error.localizedDescription
        }
    }
}
