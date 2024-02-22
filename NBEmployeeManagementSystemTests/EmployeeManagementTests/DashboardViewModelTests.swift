//
//  DashboardViewModelTests.swift
//  NBEmployeeManagementSystemTests
//
//  Created by Navnit Baldha on 22/02/24.
//

import Foundation
import XCTest
@testable import NBEmployeeManagementSystem

class CurrencyConversionViewModelTests: XCTestCase {

    private var viewModel: DashboardViewModel!
    private var mockEmployeeService: MockEmployeeService!
    private var mockWorkspaceService: MockWorkspaceService!
    private var mockEmployee = MockEmployee()
    private var mockWorkspace = MockWorkspace()


    override func setUp() {
        mockEmployeeService = MockEmployeeService.shared
        mockWorkspaceService = MockWorkspaceService.shared
        viewModel = DashboardViewModel(employeeService: mockEmployeeService, workspaceService: mockWorkspaceService)
    }

    func test_should_get_employee_and_workspace_data_when_api_call() {
        let expectation = expectation(description: #function)
        let result1 = mockWorkspace.buildWorkspace()
        let result2 = mockEmployee.buildEmployess()
        mockEmployeeService.employeeList = mockEmployee.buildEmployess()
        mockWorkspaceService.workspaceList = mockWorkspace.buildWorkspace()
        viewModel.trigger(by: .getEmployessAndWorksapce)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4.5)

        XCTAssertEqual(result1, viewModel.workspaceList)
        XCTAssertNotEqual(result2.first?.id, viewModel.employeeList.first?.id)
        XCTAssertEqual(result2.first?.employeeId, viewModel.employeeList.first?.employeeId)
        XCTAssertEqual(result2.first?.name, viewModel.employeeList.first?.name)
    }

    func test_should_get_server_error_messages_when_get_employess_api_call() {
        let expectation = expectation(description: #function)
        let errorMessage = "Sorry, the connection to our server failed."
        mockEmployeeService.employeeList = nil
        viewModel.trigger(by: .getEmployee)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4.0)
        XCTAssertEqual(viewModel.employeeList.count, 0)
        XCTAssertEqual(errorMessage, viewModel.errorMessage)
    }

    func test_should_get_employess_data_when_api_call() {
        let expectation = expectation(description: #function)
        let result = mockEmployee.buildEmployess()
        mockEmployeeService.employeeList = mockEmployee.buildEmployess()
        viewModel.trigger(by: .getEmployee)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)

        XCTAssertNotEqual(result.first?.id, viewModel.employeeList.first?.id)
        XCTAssertEqual(result.first?.employeeId, viewModel.employeeList.first?.employeeId)
        XCTAssertEqual(result.first?.name, viewModel.employeeList.first?.name)
    }


    func test_should_get_server_error_messages_when_get_workspace_api_call() {
        let expectation = expectation(description: #function)
        let errorMessage = "Sorry, the connection to our server failed."
        mockWorkspaceService.workspaceList = nil
        viewModel.trigger(by: .getWorkspace)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4.0)

        XCTAssertEqual(viewModel.workspaceList.count, 0)
        XCTAssertEqual(errorMessage, viewModel.errorMessage)
    }

    func test_should_get_workspace_data_when_api_call() {
        let expectation = expectation(description: #function)
        let result = mockWorkspace.buildWorkspace()
        mockWorkspaceService.workspaceList = mockWorkspace.buildWorkspace()
        viewModel.trigger(by: .getWorkspace)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)

        XCTAssertEqual(result, viewModel.workspaceList)
    }
}
