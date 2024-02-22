//
//  MockWorkspace.swift
//  NBEmployeeManagementSystemTests
//
//  Created by Navnit Baldha on 22/02/24.
//

import Foundation
@testable import NBEmployeeManagementSystem

final class MockWorkspace {
    func buildWorkspace() -> [Workspace] {
        return [workspace()]
    }
    
    private func workspace() -> Workspace {
        return Workspace(
            id: "2",
            createdAt: "2022-01-25T14:37:26.128Z",
            isOccupied: false,
            maxOccupancy: 34072
        )
    }
}
