//
//  EditProfileTV update Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import Foundation

extension EditProfileVC: FormTableViewCellDelegate {
    func formTableViewCell(_ cell: FormTVCell, didUpdateField updatedModel: EditProfileFormModel) {
        print(updatedModel.value ?? "nil")
    }
}
