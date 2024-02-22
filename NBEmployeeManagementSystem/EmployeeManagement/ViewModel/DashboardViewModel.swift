//
//  DashboardViewModel.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import Combine
import Network

class DashboardViewModel: ObservableObject {
    
    // MARK: Variables & constants
    @Published var employeeList = [Employee]()
    @Published var workspaceList = [Workspace]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var networkStatus: NWPath.Status = .satisfied
    
    // MARK: Private Variables
    @Published private(set) var sessionInterval: SessionInterval
    private let employeeService: EmployeeServiceProtocol
    private let workspaceService: WorkspaceServiceProtocol
    private var bag = Set<AnyCancellable>()
    
    // MARK: Init
    init(
        employeeService: EmployeeServiceProtocol = EmployeeService.shared,
        workspaceService: WorkspaceServiceProtocol = WorkspaceService.shared,
        sessionInterval: SessionInterval = SessionInterval.shared
    ) {
        self.employeeService = employeeService
        self.workspaceService = workspaceService
        self.sessionInterval = sessionInterval
        NWPathMonitor()
            .publisher()
            .map { $0.status}
            .assign(to: &$networkStatus)
    }
    
    enum Intent {
        case getEmployessAndWorksapce
        case getEmployee
        case getWorkspace
    }
    
    func trigger(by intent: Intent) {
        switch intent {
        case .getEmployessAndWorksapce:
            combinedPublisher()
        case .getEmployee:
            getEmployees()
        case .getWorkspace:
            getWorkspaceService()
        }
    }
}

//
// MARK: Private functions
// Private extension
private extension DashboardViewModel {
    func combinedPublisher() {
        isLoading = true
        errorMessage = nil
        let group = DispatchGroup()
        let queueEmployess = DispatchQueue(label: "employess")
        
        group.enter()
        queueEmployess.async(group: group) { [weak self] in
            self?.getEmployees()
            self?.getWorkspaceService()
            group.leave()
        }
        group.notify(queue: .main) { [weak self] in
            self?.isLoading = false
        }
    }
    
    func getEmployees() {
        if networkStatus == .satisfied  {
            employeeService.getEmployee(url: "\(APIEndPoints.currentVersion)/\(APIEndPoints.employee)")
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    
                    switch completion {
                    case .finished:
                        debugPrint("Get Employees list...")
                    case .failure(let error):
                        self?.errorMessage = ErrorConstants.serverErrorMessage
                        debugPrint("API Fail: \(error)")
                    }
                } receiveValue: { [weak self] userDataResponse in
                    self?.employeeList = userDataResponse
                }
                .store(in: &bag)
        } else {
            errorMessage = ErrorConstants.noInterntConnectionMessage
        }
    }
    
    func getWorkspaceService() {
        if networkStatus == .satisfied  {
            workspaceService.getWorkspace(url: "\(APIEndPoints.currentVersion)/\(APIEndPoints.workspace)")
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        debugPrint("Get Workspace list...")
                    case .failure(let error):
                        self?.errorMessage = ErrorConstants.serverErrorMessage
                        debugPrint("API Fail: \(error)")
                    }
                } receiveValue: { [weak self] userDataResponse in
                    self?.workspaceList = userDataResponse
                }
                .store(in: &bag)
        } else {
            errorMessage = ErrorConstants.noInterntConnectionMessage
        }
    }
}
