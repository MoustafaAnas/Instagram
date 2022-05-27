//
//  ListCell Update Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import Foundation

extension ListVC: ListTVCellDelegate {
    func didTapFollowUnfollowBtn(model: UserRelationship) {
        switch model.state {
        case .following:
            // perform firebase update to unfollow
            break
        case .not_following:
            // perform firebase update to follow
            break
        }
    }
}
