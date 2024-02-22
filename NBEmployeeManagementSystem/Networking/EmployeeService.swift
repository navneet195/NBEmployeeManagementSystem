//
//  EmployeeService.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import Combine
import NBNetworking

protocol EmployeeServiceProtocol {
    func getEmployee(url: String) -> AnyPublisher<EmployeeList, NBURLSessionError>
}

struct EmployeeService: EmployeeServiceProtocol {
    static let shared = EmployeeService()
    private let networkClient: NetworkingClient
    init(networkClient: NetworkingClient = NetworkingClient(baseUrl: APIConstants.baseURL)) {
        self.networkClient = networkClient
    }
}

extension EmployeeService {
    func getEmployee(url: String) -> AnyPublisher<EmployeeList, NBURLSessionError> {
        self.networkClient
            .get(requestUrl: url, header: nil)
    }
}
