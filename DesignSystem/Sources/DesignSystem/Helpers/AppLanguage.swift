//
//  AppLanguage.swift
//  
//
//  Created by Rodrigo Okido on 22/03/24.
//

import Foundation

public enum AppLanguage: String, CaseIterable, Identifiable {
    case English
    case Portuguese

    public var langCode: String {
        switch self {
        case .English:
            "en"
        case .Portuguese:
            "pt-BR"
        }
    }

    public var id: AppLanguage { self }
}
