//
//  ProfileInfoCVHeader.swift
//  Instagram
//
//  Created by Moustafa Anas on 21/05/2022.
//

import UIKit

protocol ProfileInfoCVHeaderDelegate: AnyObject {
    func profileHeaderDidTapPostsBtn(_ header: ProfileInfoCVHeader)
    func profileHeaderDidTapFollowersBtn(_ header: ProfileInfoCVHeader)
    func profileHeaderDidTapFollowingBtn(_ header: ProfileInfoCVHeader)
    func profileHeaderDidTapEditProfileBtn(_ header: ProfileInfoCVHeader)
}

final class ProfileInfoCVHeader: UICollectionReusableView {
        
 
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var postsCountLbl: UILabel!
    @IBOutlet weak var followersCountLbl: UILabel!
    @IBOutlet weak var followingCountLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var bioLbl: UILabel!
    
    public weak var delegate: ProfileInfoCVHeaderDelegate?
    
    //MARK: - init
    @IBAction func postsBtnPressed(_ sender: Any) {
        delegate?.profileHeaderDidTapPostsBtn(self)
    }
    @IBAction func followeresBtnPressed(_ sender: Any) {
        delegate?.profileHeaderDidTapFollowersBtn(self)
    }
    @IBAction func followingBtnPressed(_ sender: Any) {
        delegate?.profileHeaderDidTapFollowingBtn(self)
    }
    @IBAction func editProfileBtnPressed(_ sender: Any) {
        delegate?.profileHeaderDidTapEditProfileBtn(self)
    }
    
}
