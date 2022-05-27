//
//  Notification Tap Post Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import Foundation

extension NotificationsVC: NotificationPostEventCellDelegate {
    func didTapPostBtn(model: UserNotification) {
        switch model.type {
        case .like(let post):
            let vc = storyboard?.instantiateViewController(withIdentifier: "PostVC") as! PostVC
            vc.title = post.postType.rawValue
            vc.model = post
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
        case .follow(state: _):
            fatalError("Dev Issue: should never get called")
        }
    }
}
