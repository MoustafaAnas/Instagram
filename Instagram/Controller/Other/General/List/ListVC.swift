//
//  ListVC.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var listTV: UITableView!
    
     var data = [UserRelationship]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
    }
}



