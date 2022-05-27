//
//  Home More Btn Pressed Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import UIKit

extension HomeVC: IGFeedPostHeaderTVCellDelegate {
    func didTapMoreBtn() {
        let actionSheet = UIAlertController(title: "Post Options", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Report Post", style: .destructive, handler: { [weak self] _ in
            self?.reportPost()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    
    func reportPost() {
        
    }
}
