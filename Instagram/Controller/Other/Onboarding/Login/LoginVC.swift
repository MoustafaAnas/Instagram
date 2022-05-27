//
//  LoginVC.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import SafariServices
import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userNameOrEmailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameOrEmailTxtField.setPadding()
        passwordTxtField.setPadding()
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let userNameEmail = userNameOrEmailTxtField.text, !userNameEmail.isEmpty,
              let password = passwordTxtField.text, !password.isEmpty, password.count >= 8 else {return}
        
        // Login Functionality
        var username: String?
        var email: String?
        
        if userNameEmail.contains("@"), userNameEmail.contains(".") {
            // email
            email = userNameEmail
        } else {
            // username
            username = userNameEmail
        }
        loginApi(username: username!, email: email!, password: password)
    }
    
    @IBAction func newUserBtnPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationVC
        vc.title = "Create Account"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    @IBAction func termsOfServiceBtnPressed(_ sender: Any) {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @IBAction func privacyPolicyBtnPressed(_ sender: Any) {
        guard let url = URL(string: "https://help.instagram.com/519522125107875/?helpref=hc_fnav") else {return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    func loginApi(username: String, email: String, password: String) {
        AuthManager.shared.loginUser(userName: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    // user login
                    self.dismiss(animated: true, completion: nil)
                } else {
                    // error occured
                    let alert = UIAlertController(title: "Login Error", message: "We were unable to log you in", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
}
