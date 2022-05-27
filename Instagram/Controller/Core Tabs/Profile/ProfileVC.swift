//
//  ProfileVC.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import UIKit

/// Profile View Controller
final class ProfileVC: UIViewController {

    @IBOutlet weak var profileCV: UICollectionView!
    var userPosts = [UserPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettingsBtn))
    }
    
    @objc private func didTapSettingsBtn() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }

}






