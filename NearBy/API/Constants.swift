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
        case client_id = "NKV0UAMIO33D1RT1I0OU1O51KJH350NC0V4LKA15HGFZCV0R"
        case client_secret = "U4FZMOY4B2FE1PTUT1QICPTXP2KU3VKAGFIFERWT0QFPFI2P"
        case v = "20180323"
        case radius = "1000"
    }
    
    
}

