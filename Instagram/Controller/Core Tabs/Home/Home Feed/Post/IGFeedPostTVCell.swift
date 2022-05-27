//
//  IGFeedPostTVCell.swift
//  Instagram
//
//  Created by Moustafa Anas on 24/05/2022.
//

import UIKit
import SDWebImage
import AVFoundation

final class IGFeedPostTVCell: UITableViewCell {

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = nil
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var player: AVPlayer?
    private var playerLayer = AVPlayerLayer()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(postImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = contentView.bounds
        postImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
    }
    
    public func configureCell(with post: UserPost) {
        postImageView.image = UIImage(named: "test")
        
        return
        
        switch post.postType {
        case .photo:
            // show image
            postImageView.sd_setImage(with: post.postUrl, completed: nil)
        case .video:
            // load and play video
            player = AVPlayer(url: post.postUrl)
            playerLayer.player = player
            playerLayer.player?.volume = 0
            playerLayer.player?.play()
        }
    }
    
 
}
