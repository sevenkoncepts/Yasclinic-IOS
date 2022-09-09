//
//  DoctorsTableViewCell.swift
//  YASClinic
//
//  Created by MAC-1 on 02/03/2022.
//

import UIKit

class DoctorsTableViewCell: UITableViewCell {

    @IBOutlet weak var viewProfileButton: UIButton!
    @IBOutlet weak var bookAnAppointmentButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var bookAnAppointmentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
