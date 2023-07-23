//
//  String+Extention.swift
//  LoginScreenApp
//
//  Created by Artem Yershov on 23.07.2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
