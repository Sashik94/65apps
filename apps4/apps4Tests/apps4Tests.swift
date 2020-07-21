//
//  apps4Tests.swift
//  apps4Tests
//
//  Created by Александр Осипов on 21.07.2020.
//  Copyright © 2020 Александр Осипов. All rights reserved.
//

import XCTest
@testable import apps4

class apps4Tests: XCTestCase {
    
    let validation = Validation()
    
    func testLogin() {
        
        let trueLoginArray = [
            "qww",
            "qwe-2d.4.3223",
            "wHqq.dewde-3",
            "ET-basdd-bd-DD",
            "sadsasdaxasdxacasxasxaxaxasxssss",
            "qww@mail.ru",
            "qwe-2d.4.3223@fr.info",
            "wHqq.dewde-d@yandex.ru",
            "soviet-Alex.F@mail.ru",
            "sadsasdaxasdxacasxasxa@gmail.com",
            "ET-basdd-bd-DD@mail.ru"
        ]
        
        let falseLoginArray = [
            "XX",
            "wdwww..Dcxc",
            "dwwew2--w21",
            "9w23crwds",
            ".qwerty",
            "dsklkcmsdl32e3e3jio34r34r334hrh34ruh44r",
            "1234r@ftr.ru",
            "-erfewd@gmail.com",
            "sdfcsdce33-@mail.ru",
            ".4e3dew@bk.ru",
            "edewdww@.frfee.ru",
            "ewfc32eqq@-gmail.ru",
            "sdcsdckosldfg4367fg376fg3t7gfy37fg@mail.ru",
            "ssss--ss--wwwwqq@mail.ru",
            "dsdadsa..sddd@yandex.ru",
            "wqdqdq@-Field.ru"
        ]
        
        for login in trueLoginArray{
            XCTAssertEqual(validation.isValidation(login), true)
        }
        
        for login in falseLoginArray{
            XCTAssertEqual(validation.isValidation(login), false)
        }
    }

}
