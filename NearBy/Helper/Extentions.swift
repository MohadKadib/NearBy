//
//  Extentions.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/9/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    
    
    func displayMessage(userMessage: String) {
        
        let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
            
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func startLoading(loading: NVActivityIndicatorView) {
        
//        let loading = NVActivityIndicatorView(frame: .zero, type: .ballRotateChase, color: .green, padding: 0)
        loading.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loading)
        NSLayoutConstraint.activate([
            loading.widthAnchor.constraint(equalToConstant: 80),
            loading.heightAnchor.constraint(equalToConstant: 80),
            loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        loading.startAnimating()
        
    }
    
    
}
