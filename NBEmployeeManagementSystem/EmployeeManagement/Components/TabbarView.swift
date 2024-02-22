//
//  TabbarView.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    var body: some View {
        TabView {
            EmployeeListView(employees: dashboardViewModel.employeeList)
                .tabItem {
                    Label(Tab.employee.tabName, systemImage: Tab.employee.rawValue)
                }
            WorkspaceListView(workspace: dashboardViewModel.workspaceList)
                .tabItem {
                    Label(Tab.workspace.tabName, systemImage: Tab.workspace.rawValue)
                }
        }
        .tint(Color(ColorName.primaryColor))
        .foregroundColor(Color(ColorName.primaryColor))
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

enum Tab: String, CaseIterable {
    case employee = "person"
    case workspace = "house"
    var tabName: String {
        switch self {
        case .employee:
            return "Employee"
        case .workspace:
            return "Workspace"
        }
    }
}
