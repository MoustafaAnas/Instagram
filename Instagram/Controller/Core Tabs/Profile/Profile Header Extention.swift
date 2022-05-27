//
//  Profile Header Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import UIKit

//MARK: - ProfileInfoCVHeader Delegate Extention

extension ProfileVC: ProfileInfoCVHeaderDelegate {
    
    func profileHeaderDidTapPostsBtn(_ header: ProfileInfoCVHeader) {
        // scroll to posts
        profileCV?.scrollToItem(at: IndexPath(row: 0, section: 1), at: .top, animated: true)
    }
    
    func profileHeaderDidTapFollowersBtn(_ header: ProfileInfoCVHeader) {
        var mockData = [UserRelationship]()
        for n in 0..<10 {
            mockData.append(UserRelationship(name: "Joe", username: "@Joe", state: n % 2 == 0 ? .following: .not_following))
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        vc.data = mockData
        vc.title = "Followers"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func profileHeaderDidTapFollowingBtn(_ header: ProfileInfoCVHeader) {
        var mockData = [UserRelationship]()
        for n in 0..<10 {
            mockData.append(UserRelationship(name: "Joe", username: "@Joe", state: n % 2 == 0 ? .following: .not_following))
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        vc.data = mockData
        vc.title = "Following"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func profileHeaderDidTapEditProfileBtn(_ header: ProfileInfoCVHeader) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        vc.title = "Edit Profile"
        vc.navigationItem.largeTitleDisplayMode = .never
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    
}
