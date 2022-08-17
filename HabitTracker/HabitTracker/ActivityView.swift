//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 17.08.2022.
//

import SwiftUI

struct ActivityView: View {
    let activity: Activity
    
    var body: some View {
        VStack {
            Text(activity.description)
            Spacer()
        }
        .padding()
        .navigationTitle(activity.name)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActivityView(activity: Activity(name: "Learn English", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ultricies tempor sagittis. Quisque cursus rutrum orci vel lobortis. Etiam porttitor odio at aliquet vulputate. Maecenas sed ultricies erat. Proin id lobortis sem. Vivamus congue accumsan risus nec consequat. Proin posuere lectus eros, ac ultrices sem scelerisque iaculis. Maecenas non convallis purus, a venenatis diam."))
        }
    }
}
