//
//  Workspace.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import Foundation

// MARK: - Welcome Model
struct Workspace: Codable, Identifiable, Equatable {
    let id: String
    let createdAt: String
    let isOccupied: Bool
    let maxOccupancy: Int

    enum CodingKeys: String, CodingKey {
        case id, createdAt, isOccupied
        case maxOccupancy
    }

    static func WorkspacePreview() -> Workspace {
        return Workspace(
            id: "2",
            createdAt: "2022-01-25T14:37:26.128Z",
            isOccupied: false,
            maxOccupancy: 34072
        )
    }
}

typealias WorkspaceList = [Workspace]
