//
//  EmployeeCardView.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import SwiftUI

struct EmployeeCardView: View {
    private let imageSize = 90.0
    var employee: Employee
    var body: some View {
        HStack {
            CacheAsyncImage(
                url: URL(string: employee.avatar)!
            ) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: imageSize, height: imageSize)
                        .cornerRadius(6)

                case .failure( _):
                    Text(Constant.noImageAvaiable)
                        .frame(width: imageSize, height: imageSize)
                        .fontWeight(.heavy)
                case .empty:
                    ProgressView()
                        .frame(width: imageSize, height: imageSize)
                @unknown default:
                    // AsyncImagePhase is not marked as @frozen.
                    // We need to support new cases in the future.
                    Image(systemName: SystemIconName.questionmark)
                }
            }

            VStack(alignment: .leading, spacing: 5) {
                let name = "\(employee.firstName) \(employee.lastName)"
                Text(employee.name ?? name)
                    .font(.title3.bold())
                Text(EmployeeDetailContant.designation).font(.headline).bold() + Text(employee.jobtitle)
                    .font(.headline)
                    .foregroundColor(.black.opacity(0.8))
            }

            Spacer()

            Image(systemName: SystemIconName.chevronRight)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color(ColorName.primaryColor))
                .cornerRadius(10)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color(UIColor.systemGroupedBackground))
    }
}


struct EmployeeCardView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeCardView(employee: Employee.ExamplePreview())
    }
}
