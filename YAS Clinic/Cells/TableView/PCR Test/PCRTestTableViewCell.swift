//
//  PCRTestTableViewCell.swift
//  YAS Clinic
//
//  Created by MAC-1 on 01/03/2022.
//

import UIKit

class PCRTestTableViewCell: UITableViewCell {

    @IBOutlet weak var getDirectionButton: UIButton!
    
    
    @IBOutlet weak var hospitalImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var hospitalNameLabel: UILabel!
    @IBOutlet weak var phoneNoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
