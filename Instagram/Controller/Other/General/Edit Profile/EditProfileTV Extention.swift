//
//  EditProfileTV Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import UIKit

extension EditProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        editProfileVC.delegate = self
        editProfileVC.dataSource = self
        editProfileVC.tableHeaderView = createHeaderTableView()
    }
    
    private func createHeaderTableView() -> UIView {
        
        return editProfileTVHeader
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FormTVCell
        let model = models[indexPath.section][indexPath.row]
        cell.configureCell(with: model)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private Information"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
