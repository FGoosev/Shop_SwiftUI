//
//  PersonalArea.swift
//  Shop
//
//  Created by Alexandr Gusev on 20.06.2022.
//  Copyright © 2022 com.fgoosev. All rights reserved.
//

import SwiftUI

struct PersonalArea: View {
    @State var image: UIImage = (UIImage(named: "img") ?? UIImage())
    private func retrieveImage() -> UIImage? {
        
            if let imageData = UserDefaults.standard.object(forKey: "image") as? Data,
            let image = UIImage(data: imageData){
                
                return image
            }
        return image
    }
    var body: some View {
        ScrollView{
            Image(uiImage: retrieveImage() ?? UIImage(named: "1")!)
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .padding()
            VStack(alignment: .leading){
                Text("\(UserDefaults.standard.string(forKey: "name") ?? "")")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
                Text("\(UserDefaults.standard.string(forKey: "bithdate") ?? "")")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
                Text("\(UserDefaults.standard.string(forKey: "city") ?? "")")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
                Text("\(UserDefaults.standard.string(forKey: "address") ?? "")")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
            }
            
        }.navigationTitle(Text("Personal area"))
            .padding(.top)
            .toolbar{
                NavigationLink{
                    EditPersonalArea()
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
    }
}

struct PersonalArea_Previews: PreviewProvider {
    static var previews: some View {
        PersonalArea(image: UIImage())
    }
}
