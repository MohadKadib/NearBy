//
//  HomeViewController.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/7/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIClient.getExplore(ll: "40.7243,-74.0018", client_id: "NKV0UAMIO33D1RT1I0OU1O51KJH350NC0V4LKA15HGFZCV0R", client_secret: "U4FZMOY4B2FE1PTUT1QICPTXP2KU3VKAGFIFERWT0QFPFI2P", v: "20180323", radius: "1000", completionHandler: { (venues) in
            
            
            guard let venuesArray = venues else {return}
            
            
            
            
        }) { (error) in
            print(error?.localizedDescription as Any)
        }

       
    }
    


}
