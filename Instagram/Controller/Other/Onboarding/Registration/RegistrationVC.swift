//
//  RegistrationVC.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import UIKit

class RegistrationVC: UIViewController {

    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTxtField.setPadding()
        emailTxtField.setPadding()
        passwordTxtField.setPadding()
    }
    
    @IBAction func registerBtnPressed(_ sender: Any) {
        guard let username = userNameTxtField.text, !username.isEmpty,
              let email = emailTxtField.text, !email.isEmpty,
              let password = passwordTxtField.text, !password.isEmpty, password.count >= 8 else {return}
        
        AuthManager.shared.registerNewUser(userName: username, email: email, password: password) { isRegistered in
            DispatchQueue.main.async {
                if isRegistered {
                    // good to go
                } else {
                    // failed
                }
            }
        }
    }
    


}
