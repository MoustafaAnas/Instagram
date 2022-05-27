//
//  ListTVCell.swift
//  Instagram
//
//  Created by Moustafa Anas on 23/05/2022.
//

import UIKit

protocol ListTVCellDelegate: AnyObject {
    func didTapFollowUnfollowBtn(model: UserRelationship)
}

class ListTVCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var followBtn: UIButton!
    
    weak var delegate: ListTVCellDelegate?
    private var model: UserRelationship?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImg.image = nil
        nameLbl.text = nil
        usernameLbl.text = nil
        followBtn.setTitle(nil, for: .normal)
        followBtn.layer.borderWidth = 0
        followBtn.backgroundColor = nil
    }
    
    public func configureCell(with model: UserRelationship) {
        self.model = model
        usernameLbl.text = model.username
        nameLbl.text = model.name
        switch model.state {
        case .following:
            followBtn.setTitle("Unfollow", for: .normal)
            followBtn.setTitleColor(.label, for: .normal)
            followBtn.backgroundColor = .systemBackground
            followBtn.layer.borderWidth = 1
            followBtn.layer.borderColor = UIColor.label.cgColor
        case .not_following:
            followBtn.setTitle("Follow", for: .normal)
            followBtn.setTitleColor(.white, for: .normal)
            followBtn.backgroundColor = .link
            followBtn.layer.borderWidth = 0
        }
    }
    @IBAction func followUnfollowBtnPressed(_ sender: Any) {
        guard let model = model else {return}
        delegate?.didTapFollowUnfollowBtn(model: model)
    }
}
