//
//  ViewController.swift
//  The Linguist Hub
//
//  Created by MAC-1 on 08/11/2021.
//
extension UIButton{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.topLeft , .topRight],
            cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
import UIKit
import Foundation
import RSLoadingView
//import SwiftPhoneNumberFormatter
//import SwiftVideoGenerator
import AVFoundation
import AVKit
import Photos

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    
}

@IBDesignable
class customImage: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    
}

@IBDesignable
class customtxtView:UITextView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    
}

@IBDesignable
class Customtextfield: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var placeholderColor: UIColor = .lightGray {
        didSet { setValue(placeholderColor, forKeyPath: "_placeholderLabel.textColor") }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    @IBInspectable var padding: CGFloat = 0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
    }
    
}
@IBDesignable
class CustomGradientView: UIView {

     @IBInspectable var cornerRadius: CGFloat = 0.0 {
         didSet {
             layer.cornerRadius = cornerRadius
         }
     }
     override func layoutSubviews() {
         super.layoutSubviews()
         layer.masksToBounds = true
     }
     @IBInspectable var borderColor: UIColor = .clear {
         didSet {
             layer.borderColor = borderColor.cgColor
         }
     }
     
     @IBInspectable var startColor1: UIColor = .clear {
         didSet {
             layer.borderColor = borderColor.cgColor
         }
     }
     @IBInspectable var endColor: UIColor = .clear {
         didSet {
             layer.borderColor = borderColor.cgColor
             let gradientLayer:CAGradientLayer = CAGradientLayer()
              gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width + 50, height: self.bounds.height + 250)
            gradientLayer.contentsGravity = .resizeAspectFill
              gradientLayer.colors =
              [startColor1.cgColor,endColor.withAlphaComponent(1).cgColor]
             //Use diffrent colors
            gradientLayer.startPoint = CGPoint(x:1.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
             self.layer.insertSublayer(gradientLayer, at: 0)
         }
     }
     
     @IBInspectable var borderWidth: CGFloat = 0.0 {
         didSet {
             layer.borderWidth = borderWidth
         }
     }
}

@IBDesignable class CustomView:UIView {
    @IBInspectable var shadowColor: UIColor?{
        set {
            guard let uiColor = newValue else { return }
            layer.shadowColor = uiColor.cgColor
        }
        get{
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var shadowOpacity: Float{
        set {
            layer.shadowOpacity = newValue
        }
        get{
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize{
        set {
            layer.shadowOffset = newValue
        }
        get{
            return layer.shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat{
        set {
            layer.shadowRadius = newValue
        }
        get{
            return layer.shadowRadius
        }
    }
}

@IBDesignable class SingleRoundCornerBtn:UIButton {
 
    @IBInspectable var RoundTopLeftCorner: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = RoundTopLeftCorner
            self.layer.maskedCorners = [.layerMinXMinYCorner]
        }
    }
    @IBInspectable var RoundbottomRightCorner: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = RoundbottomRightCorner
            self.layer.maskedCorners = [.layerMaxXMaxYCorner]
        }
    }
    @IBInspectable var RoundTopLAndBottomR: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = RoundTopLAndBottomR
            self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMaxYCorner]
            layer.masksToBounds = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
}

class HAlert{
    class func CreateAlert(title:String,message:String,ViewController:UIViewController)
    {
        let alert = UIAlertController(title:title,message:message,preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:{ (action) in
            alert.dismiss(animated:true,completion:nil)
        }))
        ViewController.present(alert,animated:true,completion:nil)
    }
    
    public static func showAlertWithActions(style:UIAlertController.Style, title:String?, message:String?, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .cancel, handler: nil)],completion:  (() -> Swift.Void)? = nil, ViewController:UIViewController)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        ViewController.present(alert,animated:true,completion:nil)
    }
    
    class func ShowToast(VC:UIViewController,msg:String){
        let alert = UIAlertController(title: AppName, message: msg, preferredStyle: .alert)
        VC.present(alert, animated: true) {
            var i = 1
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
                if i == 3{
                    Timer.invalidate()
                    alert.dismiss(animated: true, completion: nil)
                }else{
                    i += 1
                }
            }
        }
    }
    class func ShowBoldToast(VC:UIViewController,msg:String){
        let alert = UIAlertController(title: AppName, message: msg, preferredStyle: .alert)
        VC.present(alert, animated: true) {
            var i = 1
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
                if i == 3{
                    Timer.invalidate()
                    alert.dismiss(animated: true, completion: nil)
                }else{
                    i += 1
                }
            }
        }
    }
    
    public static func toastMessage(_ message: String){
    //let myKeyWindow: UIWindow? = UIApplication.shared.keyWindowInConnectedScenes
        //guard let window = UIApplication.shared.keyWindow else {return}
        guard let window: UIWindow = UIApplication.shared.keyWindowInConnectedScenes else {return}
        let messageLbl = UILabel()
        messageLbl.text = message
        messageLbl.textAlignment = .center
        // messageLbl.font = UIFont.systemFont(ofSize: 13)
        messageLbl.lineBreakMode = .byWordWrapping
        messageLbl.numberOfLines = 0
        messageLbl.sizeToFit()
        messageLbl.font = UIFont(name: "Montserrat-Light", size: 8.0)
        messageLbl.textColor = .white
        messageLbl.backgroundColor = UIColor(white: 0, alpha: 0.8)
        let textSize:CGSize = messageLbl.intrinsicContentSize
        let labelWidth = min(textSize.width, window.frame.width - 40)
        messageLbl.frame = CGRect(x: 20, y: window.frame.height - 135, width: labelWidth + 20, height: textSize.height + messageLbl.requiredHeight() + 4)
        messageLbl.center.x = window.center.x
        messageLbl.layer.cornerRadius = messageLbl.frame.height/2
        messageLbl.layer.masksToBounds = true
        window.addSubview(messageLbl)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            UIView.animate(withDuration: 0.9, animations: {
                messageLbl.alpha = 0
            }) { (_) in
                messageLbl.removeFromSuperview()
            }
        }
    }

}
import JGProgressHUD


class loading{
    static var hud = JGProgressHUD()
    
    
    
    static var loadingView = RSLoadingView()
    
    class func show(vc:UIViewController){
        hud.textLabel.text = "Loading..."
        hud.show(in: vc.view)
        
//        loadingView.mainColor = #colorLiteral(red: 1, green: 0.3529411765, blue: 0.03529411765, alpha: 1)
//        loadingView.speedFactor = 3.0
//        loadingView.show(on: vc.view)
    }
    class func showforPosting(vc:UIViewController){
        hud.textLabel.text = "Posting Video Please Wait..."
        hud.show(in: vc.view)
   
    }
    
    class func showOnView(NeededView:UIView){
        loadingView.mainColor = #colorLiteral(red: 1, green: 0.3529411765, blue: 0.03529411765, alpha: 1)
        loadingView.speedFactor = 3.0
        loadingView.show(on: NeededView)
    }
    class func dismiss(){
      //  loadingView.hide()
        hud.dismiss(afterDelay: 1.0)
    }
}
@IBDesignable class CustomTabbarView:UITabBar {
    @IBInspectable var shadowColor: UIColor?{
        set {
            guard let uiColor = newValue else { return }
            layer.shadowColor = uiColor.cgColor
        }
        get{
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var shadowOpacity: Float{
        set {
            layer.shadowOpacity = newValue
        }
        get{
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize{
        set {
            layer.shadowOffset = newValue
        }
        get{
            return layer.shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat{
        set {
            layer.shadowRadius = newValue
        }
        get{
            return layer.shadowRadius
        }
    }
}
@IBDesignable
class CustomtabbarRoundView: UITabBar {

     @IBInspectable var cornerRadius: CGFloat = 0.0 {
         didSet {
             layer.cornerRadius = cornerRadius
         }
     }
     override func layoutSubviews() {
         super.layoutSubviews()
         layer.masksToBounds = true
     }
     @IBInspectable var borderColor: UIColor = .clear {
         didSet {
             layer.borderColor = borderColor.cgColor
         }
     }
}



//import JGProgressHUD
//
//
//class loading{
//    static var hud = JGProgressHUD()
//
//
//    class func show(vc:UIViewController){
//        hud.textLabel.text = "Loading..."
//        hud.show(in: vc.view)
//
//    }
//    class func dismiss(){
//        hud.dismiss(afterDelay: 0.5)
//    }
//}

//MARK: Badge work
@IBDesignable
class badgelbl: UILabel {
    
    static var count = 0
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    
    
}
extension badgelbl{
    func showBadge(){
        self.isHidden = false
        self.text = "\(badgelbl.count)"
    }
    func hidebadge(){
        self.isHidden = true
    }
}

class HTextfields{
    
    
    
    enum ValidationType: String {
        case email = "email"
        case phoneNumber = "phone"
        
    }
    
    class func Apply(VC:UIViewController,textfield:UITextField,validationType:ValidationType){
        let validation: ValidationType = validationType
        switch validation{
        case .email:
            print("emailvalidation")
            if textfield.text!.isEmpty{
                HAlert.ShowBoldToast(VC: VC, msg: "Please Enter Email Address.")
            }else{
                if !textfield.text!.isValidEmail(){
                    HAlert.ShowBoldToast(VC: VC, msg: "Please Enter Valid Email Address.")
                }
            }
        case .phoneNumber:
            print("phn validation")
            if textfield.text!.isEmpty{
                HAlert.ShowBoldToast(VC: VC, msg: "Please Enter Phone Number.")
            }else{
                if !textfield.text!.isValidPhone(){
                    HAlert.ShowBoldToast(VC: VC, msg: "Please Enter Valid Phone Number.")
                }
            }
        }
    }
     
}

extension UITextField{
    func HValidate()->Bool{
        if self.text!.isEmpty{
            return false
        }else{
            return true
        }
    }
}

extension String {
   
    func isValidPhone() -> Bool {
             let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
             let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
         }
    
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }

    
}


class HView{
    static var view:UIView!
    static let centerView = UIView()
    
    static var view1:UIView!
    static let centerView1 = UIView()
    
    class func ShowMessageView(requestingView:UIView,message:String,messageImage:UIImage){
        view = requestingView
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.backgroundColor = UIColor.white
        view.addSubview(centerView)
        centerView.backgroundColor = .clear
        let widthConstraint = NSLayoutConstraint(item: centerView, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 180)

        let heightConstraint = NSLayoutConstraint(item: centerView, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 180)

        let xConstraint = NSLayoutConstraint(item: centerView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)

        let yConstraint = NSLayoutConstraint(item: centerView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([widthConstraint, heightConstraint, xConstraint, yConstraint])

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = message
        label.textAlignment = .center
        label.textColor = UIColor.darkGray
        label.font = .boldSystemFont(ofSize: 15)
        centerView.addSubview(label)
        label.leftAnchor.constraint(equalTo: centerView.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: centerView.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: 0).isActive = true
        
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = messageImage
        imgView.contentMode = .scaleAspectFit
       
        centerView.addSubview(imgView)
        imgView.leftAnchor.constraint(equalTo: centerView.leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: centerView.rightAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: centerView.topAnchor).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 150).isActive = true


        view.layoutIfNeeded()
    }
    
    class func ShowMessagelabel(requestingView:UIView,message:String){
        view1 = requestingView
        centerView1.translatesAutoresizingMaskIntoConstraints = false
        centerView1.backgroundColor = UIColor.white
        view1.addSubview(centerView1)
        centerView1.backgroundColor = .clear
        let widthConstraint = NSLayoutConstraint(item: centerView1, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)

        let heightConstraint = NSLayoutConstraint(item: centerView1, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 45)

        let xConstraint = NSLayoutConstraint(item: centerView1, attribute: .centerX, relatedBy: .equal, toItem: view1, attribute: .centerX, multiplier: 1, constant: 0)

        let yConstraint = NSLayoutConstraint(item: centerView1, attribute: .centerY, relatedBy: .equal, toItem: view1, attribute: .centerY, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([widthConstraint, heightConstraint, xConstraint, yConstraint])

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = message
        label.textAlignment = .center
        label.textColor = UIColor.darkGray
        label.font = .boldSystemFont(ofSize: 15)
        centerView1.addSubview(label)
        label.leftAnchor.constraint(equalTo: centerView1.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: centerView1.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: centerView1.bottomAnchor, constant: 0).isActive = true


        view1.layoutIfNeeded()
    }
    
    class func RemoveMessageView(){
        centerView.removeFromSuperview()
    }
    class func RemoveMessageLabel(){
        centerView1.removeFromSuperview()
    }
    
}

//****************//

//@IBDesignable extension UIButton {
//
//    @IBInspectable var borderWidth: CGFloat {
//        set {
//            layer.borderWidth = newValue
//        }
//        get {
//            return layer.borderWidth
//        }
//    }
//
//    @IBInspectable var cornerRadius: CGFloat {
//        set {
//            layer.cornerRadius = newValue
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//
//    @IBInspectable var borderColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//}


extension UIView {

    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }

    @IBInspectable var cornerRadiuss: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue

            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }


    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
               shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
               shadowOpacity: Float = 0.4,
               shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    
}
extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
@IBDesignable
class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.shadowRadius = newValue
            layer.masksToBounds = false
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.shadowColor = UIColor.lightGray.cgColor
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            layer.shadowColor = UIColor.lightGray.cgColor
            layer.masksToBounds = false
        }
    }

}
extension UITextField{
class UITextFieldPadding : UITextField {
 let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 10)
 required init?(coder aDecoder: NSCoder) {
  super.init(coder: aDecoder)
 }
 override func textRect(forBounds bounds: CGRect) -> CGRect {
  return bounds.inset(by: padding)
 }
 override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
  return bounds.inset(by: padding)
 }
 override func editingRect(forBounds bounds: CGRect) -> CGRect {
  return bounds.inset(by: padding)
 }
}
}

@IBDesignable
class CustomTextField: UITextField {
    
    var padding: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: 0, left: paddingValue, bottom: 0, right: 5)
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    @IBInspectable var paddingValue: CGFloat = 0
    
    
    @IBInspectable var borderColor: UIColor? = UIColor.clear {
        didSet {
            layer.borderColor = self.borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor?.cgColor
    }
    
}
class UITextViewPadding : UITextView {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    textContainerInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10)
  }
}

class RoundTextField : UITextField {
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var ShadowColor : UIColor? {
        didSet{
            //layer.borderWidth = ShadowColor
            
               layer.shadowColor = ShadowColor?.cgColor
               layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
               
               layer.shadowRadius = 6.0
               layer.shadowOpacity = 1.0
        }
    }

    @IBInspectable var borderColor : UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var bgColor : UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }

    @IBInspectable var leftImage : UIImage? {
        didSet {
            if let image = leftImage{
                leftViewMode = .always
                let imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: 20, height: 20))
                imageView.image = image
                imageView.tintColor = tintColor
                let view = UIView(frame : CGRect(x: 0, y: 0, width: 25, height: 20))
                view.addSubview(imageView)
                leftView = view
            }else {
                leftViewMode = .never
            }

        }
    }

    @IBInspectable var placeholderColor : UIColor? {
        didSet {
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            let str = NSAttributedString(string: rawString, attributes: [NSAttributedString.Key.foregroundColor : placeholderColor!])
            attributedPlaceholder = str
        }
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 50, dy: 5)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 50, dy: 5)
    }

}
extension UIApplication {

    /// The app's key window taking into consideration apps that support multiple scenes.
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }

}

//class phoneFormater{
//class func setUpPhoneTextField(textField: UITextField){
//    //borderColor = lightgyay
//
//    textField.layer.borderWidth = 1
//    textField.layer.borderColor = UIColor.lightGray.cgColor
//    textField.layer.cornerRadius = 8
//    textField.clipsToBounds = true
//    textField.setLeftPaddingPoints(26)
//}
//
//
//class func defaultExample(textField: PhoneFormattedTextField) {
//textField.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "# (###) ###-####")
//}
//
//class func prefixExample(textField: PhoneFormattedTextField) {
//textField.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "(###) ###-####")
//textField.prefix = "+1 "
//    let custom = PhoneFormat(phoneFormat: "(###) ###-####", regexp: "^[0-689]\\d*$")
//textField.config.add(format: custom)
//}
//
//    class func notPrefixExample(textField: PhoneFormattedTextField) {
//    textField.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "(###) ###-####")
//    textField.prefix = "+1 "
//        let custom = PhoneFormat(phoneFormat: "(###) ###-####", regexp: "^[0-689]\\d*$")
//    textField.config.add(format: custom)
//    }
//
//}


//MARK:- Empty UITable view label
let emptyLabel = UILabel()
class addEmptyLbl{
    
    static func addEmptyTableViewLabel(title: String, VC: UIViewController){
        emptyLabel.isHidden = false
        emptyLabel.text = title
        emptyLabel.textColor = .gray
        VC.view.addSubview(emptyLabel)
        
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.centerXAnchor.constraint(equalTo: VC.view.centerXAnchor).isActive = true
        emptyLabel.centerYAnchor.constraint(equalTo: VC.view.centerYAnchor).isActive = true
    }
}

func convertImageToBase64String (img: UIImage) -> String {
    return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
}

func convertBase64StringToImage (imageBase64String:String) -> UIImage {
    let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
    let image = UIImage(data: imageData!)
    return image!
}

func convertImageToBase64(image: UIImage)-> String  {

    if let imageData = image.jpegData(compressionQuality: 0.25){
       let base64String = imageData.base64EncodedString()
       return base64String
    }

   return ""
}
