//
//  RecentAppointmentTableViewCell.swift
//  YAS Clinic
//
//  Created by MAC-1 on 20/04/2022.
//

import UIKit
import MapKit

class RecentAppointmentTableViewCell: UITableViewCell {

    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var visitTypeLabel: UILabel!
    @IBOutlet weak var procedureLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var cancelRequestButton: UIButton!
    @IBOutlet weak var rescheduleButton: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
