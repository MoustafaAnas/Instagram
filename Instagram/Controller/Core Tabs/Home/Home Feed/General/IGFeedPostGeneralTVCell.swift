//
//  IGFeedPostGeneralTVCell.swift
//  Instagram
//
//  Created by Moustafa Anas on 24/05/2022.
//

import UIKit

class IGFeedPostGeneralTVCell: UITableViewCell {

    @IBOutlet weak var commentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureCell(with model: [PostComment], indexPath: Int) {
        commentLbl.text = model[indexPath].text
    }
}
