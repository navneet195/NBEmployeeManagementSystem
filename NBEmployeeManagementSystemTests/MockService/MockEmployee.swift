//
//  MockEmployee.swift
//  NBEmployeeManagementSystemTests
//
//  Created by Navnit Baldha on 22/02/24.
//

import Foundation
@testable import NBEmployeeManagementSystem

final class MockEmployee {
    func buildEmployess() -> [Employee] {
        return [employee()]
    }

    private func employee() -> Employee {
        return Employee(
            employeeId: "3",
            createdAt: "2022-01-24T22:47:43.227Z",
            firstName: "Armando",
            avatar: "https://randomuser.me/api/portraits/women/23.jpg",
            lastName: "Weber",
            email: "Milton.Wisoky@gmail.com",
            jobtitle: "Principal Accounts Developer",
            favouriteColor: "sky blue",
            data: Meeting(
                id: String.empty,
                title: String.empty,
                body: String.empty,
                toID: String.empty,
                fromID: String.empty,
                meetingid: String.empty),
            to: "e7uKbUb43UnVktIVvJXVsC:APA91bGHz-oI0Lrn5yeYkXD1IqkT9KPoVnqAxMmp1bt_jNy3p3HFW-8k-fXjDscq7wYZd-jZcVYvPlLeS2hg-EP-MzQ0Klo5RMZszdoO6eICrz_kJX23NjJK5V9dKPzJzgWAKi6a3ZqZ",
            fromName: "Tina Thakare",
            name: "John Doe",
            type: "latte",
            size: "medium",
            empty: "{}"
        )
    }
}
