//
//  Constants.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import Foundation

struct APIConstants {
    static let baseURL = "https://61e947967bc0550017bc61bf.mockapi.io/api/"
}

struct APIEndPoints {
    static let currentVersion = "v1"
    static let employee = "people"
    static let workspace = "rooms"
}

enum ErrorConstants {
    static let noInterntConnectionMessage = "Network connection seems to be offline."
    static let serverErrorMessage = "Sorry, the connection to our server failed."
 }

enum SystemIconName {
    static let chevronRight = "chevron.right"
    static let questionmark = "questionmark"
    static let heart = "heart"
}

enum ColorName {
    static let primaryColor = "primaryColor"
    static let secondaryColor = "secondaryColor"
    static let shadowColor = "shadowColor"
}

enum NavigationViewTitle {
    static let employeeDetail = "Employee Detail"
    static let findEmployee = "Find Employee"
    static let findWorkspace = "Find Workspace"
}

enum EmployeeDetailContant {
    static let name = "Employee Name: "
    static let designation = "Designation: "
    static let email = "Email: "
    static let favouriteColor = "Favourite Color: "
    static let id = "Employee Id: "
    static let qualifications = "Qualifications: "
}

enum Constant {
    static let message = "Getting the employee and workspace..."
    static let tryAgain = "Try again"
    static let noImageAvaiable = "No Image Available"
    static let occupancy = "Occupancy:"
    static let description = "Bachelor's degree in Computer Science, Information Technology, or related field. Advanced degree (e.g., Master's or PhD) may be preferred for senior positions. \nStrong technical skills and proficiency in programming languages, software development tools, and IT infrastructure technologies. \nExperience with system design, development, implementation, and maintenance in enterprise-level environments. \nKnowledge of information security principles, practices, and compliance requirements (e.g., GDPR, HIPAA, ISO 27001). \nProject management experience, including familiarity with project management methodologies (e.g., Agile, Scrum, Waterfall). \nExcellent communication skills, both verbal and written, with the ability to effectively collaborate with cross-functional teams and stakeholders."
}
