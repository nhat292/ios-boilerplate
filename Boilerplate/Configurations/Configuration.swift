//
//  Configuration.swift
//  Boilerplate
//
//  Created by Quyen Xuan on 3/29/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

struct Configuration {
    
}

struct BoilerplateClientAPIKeys {
    #if DEBUG
        static let basePath = ""
        static let clientID = ""
        static let clientSecret = ""

    #elseif STAGGING
        static let basePath = ""
        static let clientID = ""
        static let clientSecret = ""

    #elseif RELEASE
        static let basePath = ""
        static let clientID = ""
        static let clientSecret = ""
    #endif
}
