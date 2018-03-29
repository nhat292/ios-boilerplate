//
//  User.swift
//  Boilerplate
//
//  Created by Quyen Xuan on 3/29/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

import Foundation

final class User: NSObject {

    let id: String
    let email: String
    let name: String

    init(id: String, email: String, name: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
