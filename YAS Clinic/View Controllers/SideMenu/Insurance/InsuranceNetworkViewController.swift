//
//  InsuranceNetworkViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 10/03/2022.
//

import UIKit
import iOSDropDown

class InsuranceNetworkViewController: UIViewController {
    
    @IBOutlet weak var insuranceTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var insuranceImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var insuranceCoverageTitleLabel: UILabel!
    @IBOutlet weak var partnersNameDropDown: DropDown!
    @IBOutlet weak var networkLabel: UILabel!
    @IBOutlet weak var yckcLabel: UILabel!
    @IBOutlet weak var ycodsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        partnersNameDropDown.didSelect{(selectedText , index ,id) in
        print("Selected String: \(selectedText) \n index: \(index)")
            let selectedIndex = index
            
            selectedPartnerId = "\(self.partnersArray[selectedIndex].id!)"
            self.getSpecificPartner(language: selectedLanguage)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        getInsuranceNetwork(language: selectedLanguage)
        getOurPartners(language: selectedLanguage)
        
        self.title = "insurance_network".localiz()
        insuranceCoverageTitleLabel.text = "insurance_coverage".localiz()
        
        
    }
    var insuranceNetwork : InsuranceNetwork_Base!
    
    func getInsuranceNetwork(language: String){
        ApiManager.callRestApi(url: Router.getInsuranceNetwork(["locale": language, "populate":"*"]), myCustomClass: InsuranceNetwork_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                
                self.insuranceNetwork = dt
                loading.dismiss()
                
                self.setData()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    var partners : OurPartners_Base!
    var partnersArray = [OurPartners_Base.Data]()
    var partnersNameArray = [String]()
    func getOurPartners(language: String){
        ApiManager.callRestApi(url: Router.getOurPartners(["locale": language, "populate":"*"]), myCustomClass: OurPartners_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                
                self.partnersArray = dt.data!
                let idd = dt.data?.first?.id
                selectedPartnerId = "\(idd!)"
                if self.partnersArray.count > 0{
                    
                    self.collectionView.reloadData()
                    
                    for name in self.partnersArray{
                        if let partnerName = name.attributes?.partner_name{
                            self.partnersNameArray.append(partnerName)
                        }
                    }
                    
                    self.partnersNameDropDown.optionArray = self.partnersNameArray
                    self.partnersNameDropDown.text = self.partnersNameArray.first
                    self.getSpecificPartner(language: selectedLanguage)
                }
                
                loading.dismiss()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    
//    var specificPartners : SpecificInsurancePartner_Base!
    var specificPartners : SpecificInsurancePartner_Base.Data!
    var specificPartnersNetworksArray = [SpecificInsurancePartner_Base.Networks]()
    func getSpecificPartner(language: String){
        ApiManager.callRestApi(url: Router.getSpecificInsurancePartener(["populate":"*"]), myCustomClass: SpecificInsurancePartner_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                
                self.specificPartners = dt.data!
                
                if let count = self.specificPartners.attributes?.networks?.count{
                    self.tableViewHeight.constant = CGFloat(count * 30)
                }
                
                self.tableView.reloadData()
                
                loading.dismiss()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    func setData(){
        
        insuranceTitleLabel.text = insuranceNetwork.data?.attributes?.title
        descriptionLabel.text = insuranceNetwork.data?.attributes?.description
        subTitleLabel.text = insuranceNetwork.data?.attributes?.sub_title
        
        let image = insuranceNetwork.data?.attributes?.ct_img?.data?.attributes?.url
        let newString = image?.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        let url = "https://api-yas.broomstickcreative.com\(newString!)"
        insuranceImageView.sd_setImage(with: URL(string: url ),placeholderImage: #imageLiteral(resourceName: "person"))
    }
    
}

extension InsuranceNetworkViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return partnersArray.count
        
        
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ourPartnersCollectionViewCell", for: indexPath as IndexPath) as! ourPartnersCollectionViewCell
        let data = partnersArray[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.bgView.cornerRadiuss = 15.0 //cell.bgView.frame.height/2.0
        cell.itemImageView.cornerRadiuss = 15.0 //cell.itemImageView.frame.height/2.0
        
        let image = data.attributes?.logo?.data?.attributes?.url
        let newString = image?.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        let url = "https://api-yas.broomstickcreative.com\(newString!)"
        cell.itemImageView.sd_setImage(with: URL(string: url ),placeholderImage: #imageLiteral(resourceName: "person"))
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/3.2, height: collectionView.frame.width/3.2)
        
        
    }
}

extension InsuranceNetworkViewController: UITableViewDelegate, UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if specificPartners != nil{
            return specificPartners.attributes?.networks?.count ?? 0
        }else{
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    /*networkLabel
     yckcLabel
     ycodsLabel*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificInsurancePartnerTableViewCell", for: indexPath) as! SpecificInsurancePartnerTableViewCell
        let data = specificPartners.attributes?.networks?[indexPath.row]
        
        cell.networkLabel.text = data?.network_name
        
        let yckc = data?.yckc ?? false
        let ycods = data?.ycods ?? false
        
        if yckc{
            cell.yckcImageView.alpha = 1
            cell.yckcLabel.alpha = 0
            
            cell.yckcImageView.image = #imageLiteral(resourceName: "check")
        }else{
            cell.yckcImageView.alpha = 0
            cell.yckcLabel.alpha = 1
            
            cell.yckcLabel.text = "coming_soon".localiz()
        }
        
        if ycods{
            cell.ycodsImageView.alpha = 1
            cell.ycodsLabel.alpha = 0
            
            cell.ycodsImageView.image = #imageLiteral(resourceName: "check")
        }else{
            cell.ycodsImageView.alpha = 0
            cell.ycodsLabel.alpha = 1
            
            cell.ycodsLabel.text = "coming_soon".localiz()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
