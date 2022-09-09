//
//  HospitalsTableViewCell.swift
//  YAS Clinic
//
//  Created by MAC-1 on 28/02/2022.
//

import UIKit

class HospitalsTableViewCell: UITableViewCell {
    @IBOutlet weak var getDirectionsButton: UIButton!
    @IBOutlet weak var bookAnAppointmentButton: UIButton!
    
    @IBOutlet weak var hospitalImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var hospitalNameLabel: UILabel!
    @IBOutlet weak var phoneNoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var appointmentButtonView: CustomGradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
