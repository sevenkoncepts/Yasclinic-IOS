//
//  BookAnAppointmentViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 04/03/2022.
//

import UIKit
import iOSDropDown
import BEMCheckBox

struct patientInfo{
    var name = ""
    var email = ""
    var phoneNo = ""
    var preferedDate = Date()
    var specialityId = -1
    var doctorId = -1
}
var patient = patientInfo()
var patientData = [patientInfo]()


class BookAnAppointmentViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var specialitiesDropDownTextField: DropDown!
    @IBOutlet weak var doctorsDropDownTextField: DropDown!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var understandCB: BEMCheckBox!
    
    @IBOutlet weak var expertHealthCareTitleLabel: UILabel!
    @IBOutlet weak var subHeadingTitleLabel: UILabel!
    @IBOutlet weak var understandLabel: UILabel!
    @IBOutlet weak var subHeadingTwoTitleLabel: UILabel!
    @IBOutlet weak var vaccinationInquiresLabel: UILabel!
    @IBOutlet weak var testingInquiresLabel: UILabel!
    @IBOutlet weak var oneDaySurgeryLabel: UILabel!
    @IBOutlet weak var stemCallCenterLabel: UILabel!
    
    @IBOutlet weak var bookAnAppointmentButton: UIButton!
    @IBOutlet weak var bookAnAppointmentLabel: UILabel!
    @IBOutlet weak var prefferedDateTextField: UITextField!
    
    
    var doctorID = -1
    var doctorsData : Doctors!
    var specialityIndex = -1
    var doctorIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()

        understandCB.boxType = .square
        getSpecialities(language: selectedLanguage)
        // Do any additional setup after loading the view.
        
        
        specialitiesDropDownTextField.didSelect{(selectedText , index ,id) in
        print("Selected String: \(selectedText) \n index: \(index)")
            self.specialityIndex = index
            self.doctorsData = self.speciliatiesArray[index].attributes?.doctors
            
            
            self.doctorsDropDownTextField.text = ""
            self.doctorsDropDownData.removeAll()
            for doctor in self.doctorsData.data ?? [] {
                
                self.doctorsDropDownData.append((doctor.attributes?.doc_name)!)
                
            }
            
            
            self.doctorsDropDownTextField.optionArray = self.doctorsDropDownData
        }
        
        
        doctorsDropDownTextField.didSelect{(selectedText , index ,id) in
        print("Selected String: \(selectedText) \n index: \(index)")
            self.doctorIndex = index
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "book_an_appointment".localiz()
        expertHealthCareTitleLabel.text = "expert_health_care".localiz()
        subHeadingTitleLabel.text = "book_an_appointment_subheading".localiz()
        understandLabel.text = "book_an_appointment_check_box".localiz()
        subHeadingTwoTitleLabel.text = "book_an_appointment_long_text_second".localiz()
        testingInquiresLabel.text = "pcr_testing_inquries".localiz()
        vaccinationInquiresLabel.text = "pcr_vaccination_inquries".localiz()
        oneDaySurgeryLabel.text = "yas_clinic_one_day_surgery_text".localiz()
        stemCallCenterLabel.text = "abu_dhabi_stem_cells_center_text".localiz()
        bookAnAppointmentLabel.text = "book_an_appointment".localiz()
        
        
        nameTextField.placeholder = "full_name".localiz()
        emailTextField.placeholder = "email_address".localiz()
        phoneNoTextField.placeholder = "phone_no".localiz()
        prefferedDateTextField.placeholder = "preferred_date".localiz()
        specialitiesDropDownTextField.placeholder = "select_specialist".localiz()
        doctorsDropDownTextField.placeholder = "select_doctor".localiz()
        notesTextField.placeholder = "any_notes_for_doctor".localiz()
    }
    
    @IBAction func understandCBAction(_ sender: Any) {
//        if understandCB.on{
//            understandCB.on = false
//        }else{
//            understandCB.on = true
//        }
    }
    @IBAction func backAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Appointment", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "calendarNav") as! UINavigationController

        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
//        navigationController?.pushViewController(vc,animated: true)
    }
    @IBAction func bookAnAppointmentAction(_ sender: Any) {
        
        if Reachability.isConnectedToNetwork(){
            if nameTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_name".localiz())
            }else if emailTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_email_address".localiz())
            }else if phoneNoTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_phone_no".localiz())
            }else if specialitiesDropDownTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_select_speciality".localiz())
            }else if doctorsDropDownTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_select_doctor".localiz())
            }else{
                if emailTextField.text!.isValidEmail(){
                    
                    if understandCB.on{
                        
                        patient.name = ""
                        patient.email = ""
                        patient.phoneNo = ""
                        patient.preferedDate = Date()
                        patient.specialityId = -1
                        patient.doctorId = -1
                        
                        patient.name = nameTextField.text!
                        patient.email = emailTextField.text!
                        patient.phoneNo = phoneNoTextField.text!
                        patient.preferedDate = Date()
                        patient.specialityId = speciliatiesArray[specialityIndex].id!
                        patient.doctorId = (self.doctorsData.data?[doctorIndex].id)!
                        
                        
                        let storyboard = UIStoryboard(name: "Appointment", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController

                        vc.modalPresentationStyle = .fullScreen
                        vc.modalTransitionStyle = .crossDissolve
                        navigationController?.pushViewController(vc,animated: true)
                        
                        
                    }else{
                        HAlert.ShowToast(VC: self, msg: "please_check_understand".localiz())
                    }
                    
                    
                    
                    print(patient)
                    
                }else{
                    HAlert.ShowToast(VC: self, msg: "please_enter_valid_email".localiz())
                }
            }
        }
        else{
            HAlert.ShowToast(VC: self, msg: Reachability.notConnectivityMessage)
        }
        
    }
    
    
    var specialities : Specialities_Base!
    var speciliatiesArray = [Specialities_Base.Data]()
    var specilitiesDropDownData = [String]()
    var doctorsDropDownData = [String]()
    func getSpecialities(language: String){
        ApiManager.callRestApi(url: Router.getSpecialities(["locale": language, "populate":"*"]), myCustomClass: Specialities_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                
                self.speciliatiesArray = dt.data!
                loading.dismiss()
                
                for spec in self.speciliatiesArray{
                    self.specilitiesDropDownData.append((spec.attributes?.title)!)
                }
                self.specialitiesDropDownTextField.optionArray = self.specilitiesDropDownData
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    
}
