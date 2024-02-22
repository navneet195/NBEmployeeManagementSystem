//
//  MockEmployeeService.swift
//  NBEmployeeManagementSystemTests
//
//  Created by Navnit Baldha on 22/02/24.
//

import Foundation
import Combine
import NBNetworking
@testable import NBEmployeeManagementSystem

class MockEmployeeService: EmployeeServiceProtocol {

    static let shared = MockEmployeeService()
    var employeeList: [Employee]?
    var getemployeeCount: Int = 0

    func getEmployee(url: String) -> AnyPublisher<EmployeeList, NBURLSessionError> {
        if let result = employeeList {
            getemployeeCount = result.count
            return Just(result)
                .setFailureType(to: NBURLSessionError.self)
                .eraseToAnyPublisher()
        }
        return Fail(error: NBURLSessionError.responseError)
            .eraseToAnyPublisher()
    }
}
