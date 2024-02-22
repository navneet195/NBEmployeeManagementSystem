//
//  EmployeeDetailView.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import SwiftUI
struct EmployeeDetailView: View {

    // MARK: Variables & constants
    var employee: Employee
    private let imageSize = 300.0

    // MARK: UI Appear
    var body: some View {
        ScrollView {
            ZStack{
                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing) {
                        CacheAsyncImage(
                            url: URL(string: employee.avatar)!
                        ) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .ignoresSafeArea(edges: .top)
                                    .frame(height: imageSize)

                                Image(systemName: SystemIconName.heart)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(.top, 55)
                                    .padding(.trailing, 20)

                            case .failure( _):
                                VStack(alignment: .center) {
                                    Text(Constant.noImageAvaiable)
                                        .frame(height: imageSize)
                                        .fontWeight(.heavy)
                                }.padding()

                            case .empty:
                                ProgressView()
                                    .frame(height: imageSize)
                            @unknown default:
                                // AsyncImagePhase is not marked as @frozen.
                                // We need to support new cases in the future.
                                Image(systemName: SystemIconName.questionmark)
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 8.0) {
                        HStack {
                            Text(EmployeeDetailContant.name)
                                .font(.headline .bold())

                            Text("\(employee.firstName) \(employee.lastName)" )
                                .font(.headline .bold())
                                .foregroundColor(.black)
                            Spacer()
                        }

                        HStack {
                            Text(EmployeeDetailContant.designation)
                                .font(.headline .bold())

                            Text(employee.jobtitle)
                                .font(.headline .bold())
                                .foregroundColor(.black)
                            Spacer()
                        }

                        HStack {
                            Text(EmployeeDetailContant.email)
                                .font(.headline .bold())

                            Text(employee.email)
                                .font(.headline .bold())
                                .foregroundColor(.black)

                            Spacer()

                        }

                        HStack {
                            Text(EmployeeDetailContant.favouriteColor)
                                .font(.headline .bold())

                            Text(employee.favouriteColor)
                                .font(.headline .bold())
                                .foregroundColor(.black)
                            Spacer()
                        }

                        HStack(alignment: .top) {
                            Text(EmployeeDetailContant.id)
                                .font(.headline .bold())
                            Text(employee.id)
                                .font(.headline .bold())
                                .foregroundColor(.black)
                            Spacer()
                        }

                        
                        Text(EmployeeDetailContant.qualifications)
                            .font(.headline .bold())
                        Text(Constant.description)
                            .foregroundColor(.black)
                        Spacer()

                    }
                    .padding()
                    .background(Color(ColorName.shadowColor))
                    .cornerRadius(20)
                    .offset(y: -30)
                }
            }
        }
        .ignoresSafeArea(edges: .top)

    }
}

struct EmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetailView(employee: Employee.ExamplePreview())
    }
}
