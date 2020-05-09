//
//  Place.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/8/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import Foundation
import SwiftyJSON

class Venue{

    var name: String!
    var photo: String!
    var adress: String!


    
    init(fromJson json: JSON!) {
        if json.isEmpty{
            return
        }
        
        name = json["name"].stringValue
        adress = json["location"]["address"].stringValue
        //photo = json["photos"]["groups"]
        
    }

}
