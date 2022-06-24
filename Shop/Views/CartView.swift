//
//  CartView.swift
//  Shop
//
//  Created by Alexandr Gusev on 18.06.2022.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView{
            if cartManager.products.count > 0{
                ForEach(cartManager.products, id: \.id){ product in
                    ProductRow(product: product)
                }
                HStack{
                    Text("Your cart is total is")
                    Spacer()
                    Text("\(cartManager.total)P")
                        .bold()
                }
                .padding()
                
                PaymentButton(action: {})
                    .environmentObject(cartManager)
            } else{
                Text("Your cart is empty")
            }
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
