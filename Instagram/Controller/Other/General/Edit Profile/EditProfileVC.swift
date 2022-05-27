//
//  EditProfileVC.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import UIKit

final class EditProfileVC: UIViewController {

    @IBOutlet weak var editProfileVC: UITableView!
    @IBOutlet weak var editProfileTVHeader: UIView!
    
    var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        configureModels()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
    }
    
    private func configureModels() {
        // name, username, website, bio
        let section1Label = ["Name", "Username", "Bio"]
        var section1 = [EditProfileFormModel]()
        for label in section1Label {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
            section1.append(model)
        }
        models.append(section1)
        // email, phone, gender
        let section2Label = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        for label in section2Label {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
            section2.append(model)
        }
        models.append(section2)
    }
    
    @objc private func didTapSave() {
        dismiss(animated: true, completion: nil)
    }
  
    @objc private func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change Profile Picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    @IBAction func changeProfilePictureBtnPressed(_ sender: Any) {
    }
    
}




