//
//  WorkspaceService.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import Combine
import NBNetworking

protocol WorkspaceServiceProtocol {
    func getWorkspace(url: String) -> AnyPublisher<WorkspaceList, NBURLSessionError>
}

struct WorkspaceService: WorkspaceServiceProtocol {
    static let shared = WorkspaceService()
    private let networkClient: NetworkingClient
    init(networkClient: NetworkingClient = NetworkingClient(baseUrl: APIConstants.baseURL)) {
        self.networkClient = networkClient
    }
}

extension WorkspaceService {
    func getWorkspace(url: String) -> AnyPublisher<WorkspaceList, NBURLSessionError> {
        self.networkClient
            .get(requestUrl: url, header: nil)
    }
}
