//
//  Constants.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/8/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import Foundation

struct Constants {
    
    
    
    struct ProductionServer {
        static let baseURL = "https://api.foursquare.com/v2/venues/explore?"
    }
    
    enum APIParameters :String{
        case client_id
        case client_secret
        case v
        case ll
    }
    
    
}

