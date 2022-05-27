//
//  Extentions.swift
//  Instagram
//
//  Created by Moustafa Anas on 20/05/2022.
//

import Foundation

extension String {

     func safeDatabaseKey() -> String {
         return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
        }
}
