//
//  LanguageManager.swift
//  DoseFit-iOS
//
//  Created by ahmedbahnasy on 7/16/18.
//  Copyright © 2018 AhmedBahnasy. All rights reserved.
//

import Foundation
import UIKit

class LanguageManager {
    
    let appLocaleKey = "Locale"
    public static let sharedInstance = LanguageManager()
    
    private init () {
        // set default language
        let currentLocale = getCurrentLanguage()
        setLanguage(to: currentLocale)
    }
    
    func setLanguage (to newLang: Language) {
        switch newLang {
        case .ar:
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        default:
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        UserDefaults.standard.set(newLang.rawValue, forKey: appLocaleKey)
        UserDefaults.standard.set([newLang.rawValue], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
    
    func getCurrentLanguage () -> Language {
        guard let locale = UserDefaults.standard.string(forKey: appLocaleKey) else {
            return .en
        }
        return Language(rawValue: locale) ?? .en
    }
    
    func getDescription (of lang: Language) -> String {
        switch lang {
        case .en:
            return "English"
        default:
            return "العربية"
        }
    }
    
    func isRTL () -> Bool {
        guard let locale = UserDefaults.standard.string(forKey: appLocaleKey) else {
            return true
        }
        return locale == "ar"
    }
    
}

enum Language: String {
    case ar = "ar"
    case en = "en"
}





