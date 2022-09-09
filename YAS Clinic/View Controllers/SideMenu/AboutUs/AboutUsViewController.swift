//
//  AboutUsViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 10/03/2022.
//

import UIKit
import LanguageManager_iOS

class AboutUsViewController: UIViewController {

    @IBOutlet weak var whoWeAreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ourMissionLabel: UILabel!
    @IBOutlet weak var ourMissionDescriptionLabel: UILabel!
    @IBOutlet weak var valuesCollectionView: UICollectionView!
    @IBOutlet weak var partnersCollectionView: UICollectionView!
    @IBOutlet weak var ourVisionLabel: UILabel!
    @IBOutlet weak var ourVisionDescriptionLabel: UILabel!
    @IBOutlet weak var aboutUsImageView: UIImageView!
    
    @IBOutlet weak var ourValuesTitleLabel: UILabel!
    
    let ourValuesHeadersArrayEnglish = ["Compassion","Integrity","Reliability","Innovation","Sustainability"]
    
    let ourValuesHeadersArrayArabic = ["تعاطف","التكامل","الموثوقية","التعاون","الاستدامة"]
    var ourValuesImagesArray = [UIImage]()
    let image1 = #imageLiteral(resourceName: "image 21")
    let image2 = #imageLiteral(resourceName: "image 22")
    let image3 = #imageLiteral(resourceName: "reliable")
    let image4 = #imageLiteral(resourceName: "image 24")
    let image5 = #imageLiteral(resourceName: "substanibility")
    override func viewDidLoad() {
        super.viewDidLoad()

        ourValuesImagesArray.append(image1)
        ourValuesImagesArray.append(image2)
        ourValuesImagesArray.append(image3)
        ourValuesImagesArray.append(image4)
        ourValuesImagesArray.append(image5)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "about_us".localiz()
        ourValuesTitleLabel.text = "our_values".localiz()
        valuesCollectionView.reloadData()
        partnersCollectionView.reloadData()
        
        getAboutUs(language: selectedLanguage)
        getOurPartners(language: selectedLanguage)
        
    }

    
    
    var aboutUs : AboutUs_Base!
    
    func getAboutUs(language: String){
        ApiManager.callRestApi(url: Router.aboutUs(["locale": language, "populate":"*"]), myCustomClass: AboutUs_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                
                self.aboutUs = dt
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
    func getOurPartners(language: String){
        ApiManager.callRestApi(url: Router.getOurPartners(["locale": language, "populate":"*"]), myCustomClass: OurPartners_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                
                self.partnersArray = dt.data!
                loading.dismiss()
                self.partnersCollectionView.reloadData()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    func setData(){
        whoWeAreLabel.text = aboutUs.data?.attributes?.title
        descriptionLabel.text = aboutUs.data?.attributes?.who_we_are_desc
        ourMissionLabel.text = aboutUs.data?.attributes?.our_mission_title
        ourMissionDescriptionLabel.text = aboutUs.data?.attributes?.our_mission_desc
        ourVisionLabel.text = aboutUs.data?.attributes?.our_vision_title
        ourVisionDescriptionLabel.text = aboutUs.data?.attributes?.our_vision_desc
        
        let image = aboutUs.data?.attributes?.who_we_are_img?.data?.attributes?.url
        let newString = image?.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        let url = "https://api-yas.broomstickcreative.com\(newString!)"
        aboutUsImageView.sd_setImage(with: URL(string: url ),placeholderImage: #imageLiteral(resourceName: "person"))
    }
}

extension AboutUsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == valuesCollectionView{
            return ourValuesImagesArray.count
        }else{
            return partnersArray.count
        }
        
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == valuesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ourValuesCollectionViewCell", for: indexPath as IndexPath) as! ourValuesCollectionViewCell
            cell.backgroundColor = UIColor.clear
            cell.bgView.cornerRadiuss = cell.bgView.frame.height/2.0
            cell.itemImageView.image = ourValuesImagesArray[indexPath.row]
            
            if LanguageManager.shared.currentLanguage == .english{
                cell.itemLabel.text = ourValuesHeadersArrayEnglish[indexPath.row]
            }else{
                cell.itemLabel.text = ourValuesHeadersArrayArabic[indexPath.row]
            }
            
            
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ourPartnersCollectionViewCell", for: indexPath as IndexPath) as! ourPartnersCollectionViewCell
            let data = partnersArray[indexPath.row]
            cell.backgroundColor = UIColor.clear
            cell.bgView.cornerRadiuss = cell.bgView.frame.height/2.0
            cell.itemImageView.cornerRadiuss = cell.itemImageView.frame.height/2.0
            
            let image = data.attributes?.logo?.data?.attributes?.url
            let newString = image?.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
            let url = "https://api-yas.broomstickcreative.com\(newString!)"
            cell.itemImageView.sd_setImage(with: URL(string: url ),placeholderImage: #imageLiteral(resourceName: "person"))
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == valuesCollectionView{
            return  CGSize(width:73, height: 90)
        }else{
            return CGSize(width: partnersCollectionView.frame.height, height: partnersCollectionView.frame.height)
        }
        
    }
}
