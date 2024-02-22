//
//  MockWorkspaceService.swift
//  NBEmployeeManagementSystemTests
//
//  Created by Navnit Baldha on 22/02/24.
//

import Foundation
import Combine
import NBNetworking
@testable import NBEmployeeManagementSystem

class MockWorkspaceService: WorkspaceServiceProtocol {

    static let shared = MockWorkspaceService()
    var workspaceList: [Workspace]?
    var getWorkspaceCount: Int = 0

    func getWorkspace(url: String) -> AnyPublisher<WorkspaceList, NBURLSessionError> {
        if let result = workspaceList {
            getWorkspaceCount = result.count
            return Just(result)
                .setFailureType(to: NBURLSessionError.self)
                .eraseToAnyPublisher()
        }
        return Fail(error: NBURLSessionError.responseError)
            .eraseToAnyPublisher()
    }
}
