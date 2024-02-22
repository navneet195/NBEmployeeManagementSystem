//
//  WorkspaceListView.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import SwiftUI
struct WorkspaceListView: View {

    // MARK: Variables
    let workspace: [Workspace]
    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    // MARK: UI body Appear
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: column, spacing: 20) {
                        ForEach(workspace) { room in
                            WorkspaceCardView(workspace: room)
                        }
                    }
                    .padding()
                    .edgesIgnoringSafeArea([.top, .bottom])
                }
            }
            .navigationTitle(NavigationViewTitle.findWorkspace)
        }
    }
}

struct WorkspaceListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkspaceListView(workspace: [Workspace.WorkspacePreview()])
    }
}
