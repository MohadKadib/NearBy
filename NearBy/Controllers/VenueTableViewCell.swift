//
//  VenueTableViewCell.swift
//  NearBy
//
//  Created by mohammed abdulla kadib on 5/9/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import UIKit

class VenueTableViewCell: UITableViewCell {
    

    @IBOutlet weak var venueImageView: UIImageView!
    
    @IBOutlet weak var venueNameLabel: UILabel!
    
    
    @IBOutlet weak var venueAdressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
