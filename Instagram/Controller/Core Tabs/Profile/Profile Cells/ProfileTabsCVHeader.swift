//
//  ProfileTabsCVHeader.swift
//  Instagram
//
//  Created by Moustafa Anas on 22/05/2022.
//

import UIKit

protocol ProfileTabsCVHeaderDelegate: AnyObject {
    func didTapGridBtnTab()
    func didTapTaggedBtnTab()
}

class ProfileTabsCVHeader: UICollectionReusableView {

    public weak var delegate: ProfileTabsCVHeaderDelegate?
    
    private let gridBtn: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        return button
    }()
    
    private let taggedBtn: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemGray2
        button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(gridBtn)
        addSubview(taggedBtn)
        
        gridBtn.addTarget(self, action: #selector(didTapGridBtn), for: .touchUpInside)
        taggedBtn.addTarget(self, action: #selector(didTapTaggedBtn), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = self.frame.height - (Constants.padding * 2)
        let gridBtnX = ((self.frame.width/2) - size)/2
        
        gridBtn.frame = CGRect(x: gridBtnX, y: Constants.padding, width: size, height: size)
        taggedBtn.frame = CGRect(x: gridBtnX + (self.frame.width/2), y: Constants.padding, width: size, height: size)
    }
    
    @objc func didTapGridBtn() {
        gridBtn.tintColor = .systemBlue
        taggedBtn.tintColor = .systemGray2
        delegate?.didTapGridBtnTab()
    }
    
    @objc func didTapTaggedBtn() {
        gridBtn.tintColor = .systemGray2
        taggedBtn.tintColor = .systemBlue
        delegate?.didTapTaggedBtnTab()
    }
}

