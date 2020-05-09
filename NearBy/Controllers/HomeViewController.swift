//
//  HomeViewController.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/7/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var venuesArray = [Venue]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        APIClient.getExplore(ll: "40.7243,-74.0018", client_id: "NKV0UAMIO33D1RT1I0OU1O51KJH350NC0V4LKA15HGFZCV0R", client_secret: "U4FZMOY4B2FE1PTUT1QICPTXP2KU3VKAGFIFERWT0QFPFI2P", v: "20180323", radius: "1000", completionHandler: { (venues) in
            
            
            guard let safeVenues = venues else {return}
            self.venuesArray = safeVenues
            self.tableView.reloadData()
            print("gowa el APi ya bahsaaaaaaaaaaa")
            
            
            
        }) { (error) in
            print(error?.localizedDescription as Any)
        }

       
    }
    


}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("hena ahooooooooooooooooooo")
        print(venuesArray.count)
        return venuesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenueTableViewCell", for: indexPath) as! VenueTableViewCell
        
        cell.venueNameLabel.text = venuesArray[indexPath.row].name
        
        return cell
    }
    
    
    
    
}
