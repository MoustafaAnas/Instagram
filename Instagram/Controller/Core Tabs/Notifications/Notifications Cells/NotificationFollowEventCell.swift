//
//  NotificationFollowEventCell.swift
//  Instagram
//
//  Created by Moustafa Anas on 23/05/2022.
//

import UIKit

protocol NotificationFollowEventCellDelegate: AnyObject {
    func didTapFollowUnfollowBtn(model: UserNotification)
}

class NotificationFollowEventCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var notificationLbl: UILabel!
    @IBOutlet weak var followUnfollowBtn: UIButton!
    
    weak var delegate: NotificationFollowEventCellDelegate?
    private var model: UserNotification?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        followUnfollowBtn.setTitle(nil, for: .normal)
        followUnfollowBtn.backgroundColor = nil
        followUnfollowBtn.layer.borderWidth = 0
        notificationLbl.text = nil
        profileImg.image = nil
    }
    
    public func configureCell(with model: UserNotification) {
        self.model = model

        switch model.type {
        case .like(_):
            break
        case .follow(let state):
            // Configure follow btn
            switch state {
            case .following:
                // show unfollowing btn
                followUnfollowBtn.setTitle("Unfollow", for: .normal)
                followUnfollowBtn.setTitleColor(.label, for: .normal)
                followUnfollowBtn.layer.borderWidth = 1
                followUnfollowBtn.layer.borderColor = UIColor.secondaryLabel.cgColor
            case .not_following:
                // show follow btn
                followUnfollowBtn.setTitle("Follow", for: .normal)
                followUnfollowBtn.setTitleColor(.white, for: .normal)
                followUnfollowBtn.layer.borderWidth = 0
                followUnfollowBtn.backgroundColor = .link
            }
            break
        }
        
        notificationLbl.text = model.notificationText
        profileImg.sd_setImage(with: model.user.profilePicture, completed: nil)
    }
    
    @IBAction func followUnfollowBtnPressed(_ sender: Any) {
        guard let model = model else {return}
        delegate?.didTapFollowUnfollowBtn(model: model)
    }
}
