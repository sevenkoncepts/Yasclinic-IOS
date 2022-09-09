//
//  SpecificInsurancePartnerTableViewCell.swift
//  YAS Clinic
//
//  Created by MAC-1 on 17/05/2022.
//

import UIKit

class SpecificInsurancePartnerTableViewCell: UITableViewCell {

    @IBOutlet weak var networkLabel: UILabel!
    @IBOutlet weak var yckcLabel: UILabel!
    @IBOutlet weak var ycodsImageView: UIImageView!
    @IBOutlet weak var yckcImageView: UIImageView!
    @IBOutlet weak var ycodsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
