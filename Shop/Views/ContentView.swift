//
//  ContentView.swift
//  Shop
//
//  Created by Alexandr Gusev on 18.06.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id){ product in
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
                Button(action: {
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                }){
                    Text("Logout")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 120)
                        .padding()
                }
                .background(.red)
                .clipShape(Capsule())
                .padding(.bottom, 30)
            }
            .navigationTitle(Text("Shop"))
            .toolbar{
                HStack{
                    NavigationLink{
                        CartView()
                            .environmentObject(cartManager)
                    } label: {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                    NavigationLink{
                        PersonalArea(image: UIImage())
                    } label: {
                        Image(systemName: "person.circle.fill")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
