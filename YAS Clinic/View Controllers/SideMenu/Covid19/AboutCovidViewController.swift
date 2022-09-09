//
//  AboutCovidViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 04/03/2022.
//

import UIKit

class AboutCovidViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var shortTitleLabel: UILabel!
    @IBOutlet weak var vaccineInfoHeight: NSLayoutConstraint!
    @IBOutlet weak var vaccinationInquiresLabel: UILabel!
    @IBOutlet weak var testInquiresLabel: UILabel!
    @IBOutlet weak var inflectionControlLabel: UILabel!
    @IBOutlet weak var testPriorLabel: UILabel!
    @IBOutlet weak var physicalDistanceLabel: UILabel!
    @IBOutlet weak var temperatureChecksLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getAboutCovid(language: selectedLanguage)
        setDefaults()
    }
    
    func setDefaults(){
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "about_covid".localiz()
        vaccinationInquiresLabel.text = "pcr_vaccination_inquries".localiz()
        testInquiresLabel.text = "pcr_testing_inquries".localiz()
        inflectionControlLabel.text = "inflection_control_measure".localiz()
        testPriorLabel.text = "covid_ninteen_test_prior".localiz()
        physicalDistanceLabel.text = "physical_distancing_in_all_areas".localiz()
        temperatureChecksLabel.text = "temperature_checks_in_entrance".localiz()
    }
    
    var aboutCovid : AboutCovid_Base!
    
    @IBAction func vaccineInquiresAction(_ sender: Any) {
        dialNumber(number: "+971800810")
    }
    @IBAction func pcrInquiriesAction(_ sender: Any) {
        dialNumber(number: "+9718003008")
    }
    func getAboutCovid(language: String){
        ApiManager.callRestApi(url: Router.getAboutCovid(["locale": language, "populate":"*"]), myCustomClass: AboutCovid_Base.self, completionHandler: {
            (data,error) in
            if let dt = data{
                
                
                self.aboutCovid = dt
                loading.dismiss()
                
                self.setData()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    func setData(){
        titleLabel.text = aboutCovid.data?.attributes?.title
        descriptionLabel.text = aboutCovid.data?.attributes?.description
        shortTitleLabel.text = aboutCovid.data?.attributes?.short_text
        updateHeight()
    }

    func updateHeight(){
        let height = descriptionLabel.bounds.size.height
        print("Height: \(height)")
        vaccineInfoHeight.constant = vaccineInfoHeight.constant + height + 60
        
        view.layoutIfNeeded()
    }
    
    func dialNumber(number : String) {

        guard let url = URL(string: "tel://\(number)") else {
        return //be safe
        }

        if #available(iOS 10.0, *) {
        UIApplication.shared.open(url)
        } else {
        UIApplication.shared.openURL(url)
        }
    }
    
}
