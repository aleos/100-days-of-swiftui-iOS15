//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Alexander Ostrovsky on 19.08.2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order

    var body: some View {
        Text("Hello World")
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
