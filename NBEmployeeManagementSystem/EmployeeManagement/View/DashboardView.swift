//
//  DashboardView.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import SwiftUI
struct DashboardView: View {

    // MARK: Variables & constants
    @StateObject var viewmodel = DashboardViewModel()

    // MARK: UI Appear
    var body: some View {
        ZStack {
            if viewmodel.isLoading {
                LoadingView()
            } else if viewmodel.errorMessage != nil  {
                ErrorView(viewmodel: viewmodel)
            } else {
                TabbarView().environmentObject(viewmodel)
            }
        }
        .tint(Color(ColorName.primaryColor))
        .onAppear {
            viewmodel.trigger(by: .getEmployessAndWorksapce)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
