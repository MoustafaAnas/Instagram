//
//  IGFeedPostHeaderTVCell.swift
//  Instagram
//
//  Created by Moustafa Anas on 24/05/2022.
//

import UIKit
import SDWebImage

protocol IGFeedPostHeaderTVCellDelegate: AnyObject {
    func didTapMoreBtn()
}

class IGFeedPostHeaderTVCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    
    weak var delegate: IGFeedPostHeaderTVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        username.text = nil
        profileImg.image = nil
    }
    
    public func configureCell(with model: User) {
        username.text = model.username
        //profileImg.sd_setImage(with: model.profilePicture, completed: nil)
    }
    
    @IBAction func moreBtnPressed(_ sender: Any) {
        delegate?.didTapMoreBtn()
    }
}
