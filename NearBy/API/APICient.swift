//
//  APICient.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/8/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    
    @discardableResult
    private static func performRequest (route: APIRouter, _ completion:@escaping (JSON)->Void,
                                        _ failure:@escaping (Error?)->Void) -> DataRequest {
        
        return Alamofire.request(route)
            .responseJSON (completionHandler: { (response) in
                
                switch response.result {
                    
                case .success:
                    
                    guard let _ = response.result.value else {
                        failure(response.result.error)
                        return
                    }
                    print(response.result , route.urlRequest as Any)
                    let json = JSON(response.result.value as Any)
                    print(json)
                    if !(response.response?.statusCode == 200) {
                        failure(response.result.error)
                        return
                    }
                    completion(json)
                
                case .failure:
                    
                    failure(response.result.error)
                }
        })
    }
    
    
    
    
    static func getExplore(ll: String, client_id: String,client_secret: String, v: String, radius: String, completionHandler:@escaping ([Venue]?)->Void , completionFaliure:@escaping (_ error:Error?)->Void) {
        
        performRequest(route: .explore(ll: ll, client_id: client_id, client_secret: client_secret, v: v, radius: radius), { (jsonData) in
            
            let json = JSON(jsonData)
            let items = json["response"]["groups"][0]["items"]
            var venuesArray = [Venue]()
            
            if let itemAarray = items.array {
                for item in itemAarray {
                    let venue = Venue(fromJson: item["venue"])
                    venuesArray.append(venue)
                }
            }
            
            completionHandler(venuesArray)
            
            
            
        }) { (error) in
            completionFaliure(error)
        }
        
        
        
    }
    
    
    
    
    
}
