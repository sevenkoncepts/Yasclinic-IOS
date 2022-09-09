//
//  HomeViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 28/02/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let userProfileButton = UIButton(type: .custom)
    
    let dataArray = ["Specialities","Book an Appointment","Hospitals","About Covid 19","PCR Test","Insurance Network","Specialities","Book an Appointment","Hospitals","About Covid 19","PCR Test","Insurance Network"]
    override func viewDidLoad() {
        super.viewDidLoad()

        addNavBarImage()
        collectionView.register(UINib(nibName: "ServicesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ServicesCollectionViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        setupRightItem()
        self.tabBarController?.tabBar.backgroundColor = UIColor(hexString: "#003A70")
//        UITabBar.appearance().barTintColor = UIColor.black
    }
    

    func addNavBarImage() {

            let navController = navigationController!

            let image = UIImage(named: "logo.png") //Your logo url here
            let imageView = UIImageView(image: image)

            let bannerWidth = navController.navigationBar.frame.size.width
            let bannerHeight = navController.navigationBar.frame.size.height

            let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
            let bannerY = bannerHeight / 2 - (image?.size.height)! / 2

            imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
            imageView.contentMode = .scaleAspectFit

            navigationItem.titleView = imageView
        }
    
    private func setupRightItem() {
        
        userProfileButton.imageView?.contentMode = .scaleAspectFill
        userProfileButton.clipsToBounds = true
        userProfileButton.addTarget(self, action: #selector(notificationTapped), for: .touchUpInside)
        let image = UIImage(systemName: "bell")
        userProfileButton.setImage(image, for: .normal)
        userProfileButton.tintColor = .white
        userProfileButton.frame = CGRect(x: 0, y: 5, width: 70, height: 70)
//        userProfileButton.layer.cornerRadius = 20
        userProfileButton.clipsToBounds = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: userProfileButton)
        
        userProfileButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userProfileButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    //MARK:- Action Navigation ImageView
    @objc private func notificationTapped() {
        // -> Action
        print("Clicked")
//        let vc = storyboard?.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
//
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .crossDissolve
//        navigationController?.pushViewController(vc,animated: true)
        
    }
    @IBAction func sideMenuAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SideMenuNavigationController")
        self.present(controller, animated: true, completion: nil)
    }

}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ServicesCollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell", for: indexPath) as! ServicesCollectionViewCell
        let data = dataArray[indexPath.row]
        cell.serviceNameLabel.text = data
//        let imageData = categoriesImages[indexPath.row]
//        cell.categoryNameLabel.text = data.title
//        cell.progressLabel.text = data.value
//        cell.categoryImage.image = imageData
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2.1, height: self.collectionView.frame.height/4.2)
    }
}
