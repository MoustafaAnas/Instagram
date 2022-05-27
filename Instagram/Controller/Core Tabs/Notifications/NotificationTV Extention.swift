//
//  NotificationTV Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import UIKit

extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        notificationsTV.delegate = self
        notificationsTV.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        switch model.type {
        case .like(post: _):
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! NotificationLikeEventCell
            cell.delegate = self
            cell.configureCell(with: model)
            return cell
        case .follow:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationFollowEventCell
            cell.delegate = self
            cell.configureCell(with: model)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
