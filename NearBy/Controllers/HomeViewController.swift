//
//  HomeViewController.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/7/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import UIKit
import CoreLocation
import SVProgressHUD
import NVActivityIndicatorView

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var moodButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    let locationManager = CLLocationManager()
    var venuesArray = [Venue]()
    var realtimeMood: Bool = true
    let loading = NVActivityIndicatorView(frame: .zero, type: .ballRotateChase, color: .black, padding: 0)
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        checkLocationServices()
        
        
       
    }
    
    
    @IBAction func switchMoodPressed(_ sender: UIBarButtonItem) {
        realtimeMood = !realtimeMood
        if realtimeMood == true {
            moodButton.title = "Realtime"
        } else {
            moodButton.title = "SingleUpdate"
        }
        
    }
    
    
    func APICall(latitude: String, longitude: String) {
        print("gowa APiCAll")
        //SVProgressHUD.show()
        let coordinates = latitude + "," + longitude
        print(coordinates)
        DispatchQueue.main.async {
            
            self.startLoading(loading: self.loading)
            APIClient.getExplore(ll: coordinates, client_id: Constants.APIParameters.client_id.rawValue, client_secret: Constants.APIParameters.client_secret.rawValue, v: Constants.APIParameters.v.rawValue, radius: Constants.APIParameters.radius.rawValue, completionHandler: { (venues) in
                
                
                guard let safeVenues = venues else {return}
                self.venuesArray = safeVenues
                self.tableView.reloadData()
                //SVProgressHUD.dismiss()
                self.loading.stopAnimating()
                
            }) { (error) in
                print(error?.localizedDescription as Any)
                self.displayMessage(userMessage: error?.localizedDescription ?? "error in server call")
                //SVProgressHUD.dismiss()
                self.loading.stopAnimating()
            }
        }
        
        
        
    }
    
    
    


}

// MARK: - TableViewMethods

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return venuesArray.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenueTableViewCell", for: indexPath) as! VenueTableViewCell
        
        cell.venueNameLabel.text = venuesArray[indexPath.row].name
        cell.venueAdressLabel.text = venuesArray[indexPath.row].adress
        
        return cell
    }
    
    
    
    
}

// MARK: - Locatoin Manager

extension HomeViewController: CLLocationManagerDelegate {
    
    func setupLocationManager() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 500
        
    }
    
    func checkLocationServices() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            setupLocationManager()
            checkLocationAuthorization()
            
        } else {
            
            
        }
        
        
        
    }
    
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        switch realtimeMood {
            
        case true:
            
            guard let location = locations.last else {return}
            APICall(latitude: String(location.coordinate.latitude), longitude: String(location.coordinate.longitude))
            
        case false:
            
            guard let location = locations.first else {return}
            APICall(latitude: String(location.coordinate.latitude), longitude: String(location.coordinate.longitude))
            
        }
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        displayMessage(userMessage: error.localizedDescription)
    }
    
    
}
