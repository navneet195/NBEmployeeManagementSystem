//
//  StringHelper.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import Foundation
public extension String {
    static var empty: String {
        ""
    }

    static var singleSpace: String {
        " "
    }

    var isNumeric: Bool {
        return self.allSatisfy { $0.isNumber }
    }
}
