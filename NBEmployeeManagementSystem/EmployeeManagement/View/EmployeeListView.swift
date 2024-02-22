//
//  EmployeeListView.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import SwiftUI
struct EmployeeListView: View {

    // MARK: Variables
    let employees: [Employee]
    @State private var searchText: String = String.empty

    // MARK: Search Component Employees
    var filteredEmployees: [Employee] {
        if searchText.count == 0 {
          return employees
        } else {
            return employees.filter { String($0.firstName.lowercased() + String.singleSpace + $0.lastName.lowercased() )
                    .contains(searchText.lowercased())
            }
        }
    }

    // MARK: UI body Appear
    var body: some View {
        NavigationView {
            List(filteredEmployees) { employee in
                EmployeeCardView(employee: employee)
                    .padding(.horizontal, 10)
                    .padding(.vertical)
                    .background(Color(ColorName.shadowColor))
                    .cornerRadius(12)
                    .overlay {
                        NavigationLink(
                            destination: {
                                EmployeeDetailView(employee: employee)
                                    .background(Color(ColorName.shadowColor))
                            },
                            label: {
                                Text(NavigationViewTitle.employeeDetail)
                            }
                        )
                        .opacity(0)
                    }
            }
            .navigationTitle(NavigationViewTitle.findEmployee)
            .searchable(text: $searchText)
            .listStyle(.inset)
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView(employees: [Employee.ExamplePreview()])
    }
}
