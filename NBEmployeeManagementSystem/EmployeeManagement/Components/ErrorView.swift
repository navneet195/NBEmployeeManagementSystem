//
//  ErrorView.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var viewmodel: DashboardViewModel
    var body: some View {
        VStack {
            Text(viewmodel.errorMessage ?? String.empty)
            Button {
                viewmodel.trigger(by: .getEmployessAndWorksapce)
            } label: {
                Text(Constant.tryAgain)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(viewmodel: DashboardViewModel())
    }
}
