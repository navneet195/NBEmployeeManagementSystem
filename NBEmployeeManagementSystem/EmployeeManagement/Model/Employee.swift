//
//  Employee.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import Foundation

// MARK: - Employee Model
struct Employee: Codable, Identifiable, Equatable {
    let id = UUID().uuidString
    let employeeId: String
    let createdAt, firstName: String
    let avatar: String
    let lastName, email, jobtitle, favouriteColor: String
    let data: Meeting?
    let to, fromName, name, type: String?
    let size, empty: String?

    enum CodingKeys: String, CodingKey {
        case employeeId = "id"
        case createdAt, firstName, avatar, lastName, email, jobtitle, favouriteColor, to, fromName, name, type, size
        case empty = "{}"
        case data = "data"
    }

    static func ExamplePreview() -> Employee {
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

// MARK: - DataClass
struct Meeting: Codable, Identifiable, Equatable {
    let id: String
    let title, body, toID: String
    let fromID, meetingid: String

    enum CodingKeys: String, CodingKey {
        case id, title, body
        case toID = "toId"
        case fromID = "fromId"
        case meetingid
    }
}

typealias EmployeeList = [Employee]
