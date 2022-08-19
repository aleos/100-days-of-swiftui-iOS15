//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Alexander Ostrovsky on 19.08.2022.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order

    var body: some View {
        Text("Hello, World!")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
