//
//  FormTVCell.swift
//  Instagram
//
//  Created by Moustafa Anas on 21/05/2022.
//

import UIKit

protocol FormTableViewCellDelegate: AnyObject {
    func formTableViewCell(_ cell: FormTVCell, didUpdateField updatedModel: EditProfileFormModel)
}

class FormTVCell: UITableViewCell {

    @IBOutlet weak var formLabel: UILabel!
    @IBOutlet weak var formTxtField: UITextField!
    
    var model: EditProfileFormModel?
    public weak var delegate: FormTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureCell(with model: EditProfileFormModel) {
        self.model = model
        formLabel.text = model.label
        formTxtField.placeholder = model.placeholder
        formTxtField.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        formTxtField.placeholder = nil
        formTxtField.text = nil
    }

}
