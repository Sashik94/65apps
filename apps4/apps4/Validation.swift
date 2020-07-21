//
//  Validation.swift
//  apps4
//
//  Created by Александр Осипов on 21.07.2020.
//  Copyright © 2020 Александр Осипов. All rights reserved.
//

import Foundation

class Validation {
    func isValidation(_ login: String) -> Bool {
        
        var loginRegEx = ""
        
        if !(login.count >= 3 && login.count <= 32) {
            return false
        }
        
        if login.contains("@") {
        loginRegEx = "^[A-Za-z]([A-Za-z0-9](.){0,1}(-){0})+[A-Za-z0-9]\\@([A-Za-z0-9])+((.-){0,1}+[A-Za-z0-9]){1}\\.[a-z]{2,4}$"
        } else {
            loginRegEx = "^[A-Za-z]([A-Za-z0-9](.){0,1}(-){0})+[A-Za-z0-9]$"
        }

        let loginPred = NSPredicate(format:"SELF MATCHES %@", loginRegEx)
        let result = loginPred.evaluate(with: login)
        return result
    }
}
