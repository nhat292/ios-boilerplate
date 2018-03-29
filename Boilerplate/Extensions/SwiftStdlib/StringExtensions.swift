//
//  StringExtensions.swift
//  Boilerplate
//
//  Created by Quyen Xuan on 3/29/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

import Foundation

public extension String {
    public var iso8601Date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        return dateFormatter.date(from: self)
    }

    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
}
