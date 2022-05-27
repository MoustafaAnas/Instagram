//
//  SettingsVC.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import UIKit
import SafariServices


/// View Controller to show user settings
final class SettingsVC: UIViewController {

    @IBOutlet weak var settingsTV: UITableView!
     var data = [[SettingsCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureModels()
        configureTableView()
    }
    
    private func configureModels() {
        data.append([
            SettingsCellModel(title: "Edit Profile") { [weak self] in
                self?.didTapEditProfile()
            },
            SettingsCellModel(title: "Invite Friends") { [weak self] in
                self?.didTapInviteFriends()
            },
            SettingsCellModel(title: "Save Original Post") { [weak self] in
                self?.didTapSaveOriginalPost()
            }
        ])
        
        data.append([
            SettingsCellModel(title: "Terms of Service") { [weak self] in
                self?.openURL(type: .terms)
            },
            SettingsCellModel(title: "Privacy Policy") { [weak self] in
                self?.openURL(type: .privacy)
            },
            SettingsCellModel(title: "Help / Feedback") { [weak self] in
                self?.openURL(type: .help)
            }
        ])
        
        data.append([
            SettingsCellModel(title: "Log Out") { [weak self] in
                self?.didTapLogOut()
            }
        ])
    }
    
   
    private func didTapEditProfile() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    private func didTapInviteFriends() {
        // show share sheet to invite friends
    }
    
    private func didTapSaveOriginalPost() {
        
    }
    
    private func openURL(type: SettingsURLType ) {
        let urlString: String
        
        switch type {
        case .terms:
            urlString = "https://help.instagram.com/581066165581870"
        case .privacy:
            urlString = "https://help.instagram.com/519522125107875/?helpref=hc_fnav"
        case .help:
            urlString = "https://help.instagram.com"
        }
        
        guard let url = URL(string: urlString) else {return}
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
  
    private func didTapLogOut() {
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut { success in
                DispatchQueue.main.async {
                    if success {
                        // present log in
                        self.goToLogin()
                    } else {
                        // error occured
                        fatalError("Could not log out user!")
                    }
                }
            }
        }))
       
        present(actionSheet, animated: true)
    }
    
    func goToLogin() {
        let loginVC = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true) {
            self.navigationController?.popToRootViewController(animated: false)
            self.tabBarController?.selectedIndex = 0
        }
    }
    

}
