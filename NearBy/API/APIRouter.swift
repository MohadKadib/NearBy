//
//  APIRouter.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/8/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case explore(ll: String, client_id: String, client_secret: String, v: String, radius: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .explore:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
            
        case .explore: return ""
        
            
        }
    }
    
    // MARK: - Parameters
    private var parameters: [URLQueryItem] {
        switch self {
            
        case.explore(let ll, let client_id, let client_secret, let v, let radius):
            
            let parameter = [
                URLQueryItem(name: "ll", value: ll),
                URLQueryItem(name: "client_id", value: client_id),
                URLQueryItem(name: "client_secret", value: client_secret),
                URLQueryItem(name: "v", value: v),
                URLQueryItem(name: "radius", value: radius)
            ]
            
            return parameter
        
      
        
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        var mainApiURL = ""
        mainApiURL = Constants.ProductionServer.baseURL + path
        var urlComponents = URLComponents(string: mainApiURL)!
        
        urlComponents.queryItems = parameters
            
            
            
        
        
        let url = urlComponents.url!
        var urlRequest = URLRequest(url: url)
        
        print("URLS REQUEST :\(urlRequest)")
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        

        
        return urlRequest as URLRequest
        
        
    }
}
