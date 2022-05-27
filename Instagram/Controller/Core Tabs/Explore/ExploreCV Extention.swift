//
//  HomeCV Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import UIKit

extension ExploreVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        exploreCV.delegate = self
        exploreCV.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == exploreCV {
            return 100
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == exploreCV {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ExploreCVCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(with: "test")
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if collectionView == exploreCV {
            //let model = models[indexPath.row]
            let user = User(username: "Joe", bio: "i am joe", name: (first: "", last: ""), profilePicture: URL(string: "https://www.google.com")!, birthDate: Date(), gender: .male, counts: UserCount(followers: 1, following: 1, posts: 1), joinDate: Date())
            
            let post = UserPost(identefier: "", postType: .photo, thumbnailImage: URL(string: "https://www.google.com")!, postUrl: URL(string: "https://www.google.com")!, caption: nil, likeCount: [], comment: [], createdDate: Date(), taggedUsers: [], owner: user)
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "PostVC") as! PostVC
            vc.title = post.postType.rawValue
            vc.model = post
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == exploreCV {
        return CGSize(width: collectionView.frame.width * 0.313 , height: collectionView.frame.height * 0.18)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == exploreCV {
        return 3
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == exploreCV {
        return 3
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == exploreCV {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
