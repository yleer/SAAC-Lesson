//
//  LocalizableStrings.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/01.
//

import Foundation


enum LocalizableStrings: String {
    
    case welcome_text
    case data_restore
    case entert_text_placeholder
    
    var localized: String{
        return self.rawValue.localized()
    }
    
    var localizedSetting: String{
        return self.rawValue.localized(tableName: "Setting")
    }
}
