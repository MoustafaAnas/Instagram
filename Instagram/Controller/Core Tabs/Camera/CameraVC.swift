//
//  CameraVC.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import UIKit


class CameraVC: UIViewController {

    @IBOutlet weak var addPostBtn: UIButton!
    @IBOutlet weak var postTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
 
    @IBAction func addPostBtnPressed(_ sender: Any) {
       showPhotoAlert()
    }
    @IBAction func publishPostBtnPressed(_ sender: Any) {
        addPostBtn.setImage(UIImage(systemName: "plus.square.dashed"), for: .normal)
        postTextView.text = ""
    }
    
}


