//
//  ExploreCVCell.swift
//  Instagram
//
//  Created by Moustafa Anas on 25/05/2022.
//

import UIKit
import SDWebImage

class ExploreCVCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImg.image = nil
    }
    
    public func configueCell(with model: UserPost) {
        let url = model.thumbnailImage
        profileImg.sd_setImage(with: url, completed: nil)
    }
    
    public func configureCell(with imageName: String) {
        profileImg.image = UIImage(named: imageName)
    }
}
