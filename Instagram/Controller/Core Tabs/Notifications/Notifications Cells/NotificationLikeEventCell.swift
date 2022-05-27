//
//  NotificationLikeEventCell.swift
//  Instagram
//
//  Created by Moustafa Anas on 23/05/2022.
//
import SDWebImage
import UIKit

protocol NotificationPostEventCellDelegate: AnyObject {
    func didTapPostBtn(model: UserNotification)
}

class NotificationLikeEventCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var notificationLbl: UILabel!
    @IBOutlet weak var postBtn: UIButton!
  
    weak var delegate: NotificationPostEventCellDelegate?
    private var model: UserNotification?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postBtn.setBackgroundImage(nil, for: .normal)
        postBtn.backgroundColor = nil
        postBtn.layer.borderWidth = 0
        notificationLbl.text = nil
        profileImg.image = nil
    }
    
    public func configureCell(with model: UserNotification) {
        self.model = model

        switch model.type {
        case .like(let post):
            let thumbnil = post.thumbnailImage
            guard !thumbnil.absoluteString.contains("google.com") else {return}
            postBtn.sd_setBackgroundImage(with: thumbnil, for: .normal, completed: nil)
        case .follow:
            break
        }
        
        notificationLbl.text = model.notificationText
        profileImg.sd_setImage(with: model.user.profilePicture, completed: nil)
    }
    
    @IBAction func postBtnPressed(_ sender: Any) {
        guard let model = model else {return}
        delegate?.didTapPostBtn(model: model)
    }
    
}
