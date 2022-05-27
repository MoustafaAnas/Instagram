//
//  IGFeedPostActionsTVCell.swift
//  Instagram
//
//  Created by Moustafa Anas on 24/05/2022.
//

import UIKit

protocol IGFeedPostActionsTVCellDelegate: AnyObject {
    func didTaplikePost()
    func didTapCommentOnPost()
    func didTapSendPost()
}

class IGFeedPostActionsTVCell: UITableViewCell {

    @IBOutlet weak var likePost: UIButton!
    @IBOutlet weak var commentOnPost: UIButton!
    @IBOutlet weak var sendPost: UIButton!
    
    weak var delegate: IGFeedPostActionsTVCellDelegate?
    
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
    }
    
    public func configurCell(with post: UserPost) {
        
    }
    
    @IBAction func likePostBtnPressed(_ sender: Any) {
        delegate?.didTaplikePost()
    }
    @IBAction func commentOnPostBtnPressed(_ sender: Any) {
        delegate?.didTapCommentOnPost()
    }
    @IBAction func sendPostBtnPressed(_ sender: Any) {
        delegate?.didTapSendPost()
    }
}
