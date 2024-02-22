//
//  WorkspaceCardView.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import SwiftUI

struct WorkspaceCardView: View {
    
    var workspace: Workspace
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(workspace.isOccupied ? .gray : .green)
                .frame(width: 185, height: 120)

            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .center, spacing: 4) {
                    Text("#\(workspace.id)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .frame(width: 175, height: 54)
                        .foregroundColor(.white)
                        .cornerRadius(12)

                    Text("\(Constant.occupancy) \(workspace.maxOccupancy)")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct WorkspaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        WorkspaceCardView(workspace: Workspace.WorkspacePreview())
    }
}
