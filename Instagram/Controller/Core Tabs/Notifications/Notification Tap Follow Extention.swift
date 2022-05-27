//
//  Notification Tap Follow Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import Foundation

extension NotificationsVC: NotificationFollowEventCellDelegate {
    func didTapFollowUnfollowBtn(model: UserNotification) {
        print("Tap Follow")
    }
}
