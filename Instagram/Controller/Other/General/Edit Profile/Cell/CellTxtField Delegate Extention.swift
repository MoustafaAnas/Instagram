//
//  CellTxtField Delegate Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import UIKit

extension FormTVCell: UITextFieldDelegate {
    
    // MARK: - Field
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.value = textField.text
        guard let model = model else {return true}
        delegate?.formTableViewCell(self, didUpdateField: model)
        return true
    }
}
