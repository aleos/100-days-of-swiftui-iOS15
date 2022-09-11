//
//  GroupingChildrenView.swift
//  AccessibilitySandbox‌
//
//  Created by Alexander Ostrovsky on 11.09.2022.
//

import SwiftUI

struct GroupingChildrenView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(decorative: "nicolas-tissot-335096")
            
            Image(systemName: "gamecontroller.fill")
                .font(.largeTitle)
                .accessibilityHidden(true)
            
            VStack {
                Text("Your score is")
                Text("1000")
                    .font(.title)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Your score is 1000")
        }
        .navigationTitle("🤲 Grouping children")
    }
}

struct GroupChildrenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GroupingChildrenView()
        }
    }
}
