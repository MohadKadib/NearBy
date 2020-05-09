//
//  Extentions.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/9/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func displayMessage(userMessage: String) {
        
        let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
            
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
}
