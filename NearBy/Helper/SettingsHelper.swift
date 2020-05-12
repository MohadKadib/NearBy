//
//  SettingsHelper.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/12/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import Foundation


class SettingsHelper {
    
    
    //MARK:- SAVE USER DATA
    static var realtimeMood: Bool? {
        didSet {
            UserDefaults.standard.set(realtimeMood, forKey: "realtimeMood")
        }
    }
    
    
    
    
    //MARK:- GET USER DATA
    static func getRealtimeMood() -> Bool? {
        
        if let realrimeMood = UserDefaults.standard.value(forKey: "realtimeMood") as? Bool{
            SettingsHelper.realtimeMood = realrimeMood
        }
        return SettingsHelper.realtimeMood
        
    }
    
}
