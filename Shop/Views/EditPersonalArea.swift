//
//  EditPersonalArea.swift
//  Shop
//
//  Created by Alexandr Gusev on 20.06.2022.
//  Copyright © 2022 com.fgoosev. All rights reserved.
//

import SwiftUI


struct EditPersonalArea: View {
    @State private var isShowPhotoLibrary = false
    @State private var image: UIImage = (UIImage(named: "img") ?? UIImage())
    @State var name = ""
    @State var bithdate = ""
    @State var address = ""
    @State var city = ""
    
    var body: some View {
        
        ScrollView{
            VStack{
                Image(uiImage: self.image)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading){
                    Text("Name").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                    TextField("Enter name", text: $name)
                    
                    Divider()
                    
                }.padding(15)
                
                VStack(alignment: .leading){
                
                    Text("Bithdate").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                    
                    TextField("Enter Your Bithdate", text: $bithdate)
                
                    Divider()
                }.padding(15)
            
                VStack(alignment: .leading){
                    
                    Text("City").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                    
                    TextField("Enter Your City", text: $city)
                    
                    Divider()
                }.padding(15)
            
                VStack(alignment: .leading){
                    
                    Text("Address").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                    
                    TextField("Enter Your Address", text: $address)
                    
                    Divider()
                }.padding(15)
                
                VStack{
                    Button(action: {
                                    self.isShowPhotoLibrary = true
                                }) {
                                    HStack {
                                        Image(systemName: "photo")
                                            .font(.system(size: 20))
                                            
                                        Text("Photo library")
                                            .font(.headline).frame(width: UIScreen.main.bounds.width - 120).padding()
                                    }
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .padding(20)
                                }
                 
                }
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)}
                 
                VStack{
                    Button(action: {
                        if let pngRepresentation = image.pngData() {
                                
                            UserDefaults.standard.set(pngRepresentation, forKey: "image")
                                
                        }
                        
                        UserDefaults.standard.set(self.name, forKey: "name")
                        UserDefaults.standard.set(self.address, forKey: "address")
                        UserDefaults.standard.set(self.city, forKey: "city")
                        UserDefaults.standard.set(self.bithdate, forKey: "bithdate")
                    }){
                        Text("Save").frame(width: UIScreen.main.bounds.width - 120).padding()
                    }
                    .background(Color("Color"))
                        .clipShape(Capsule())
                        .padding(25)
                    
                }
            }
        }.navigationTitle(Text("Edit Personal Area"))
    }
}

struct EditPersonalArea_Previews: PreviewProvider {
    static var previews: some View {
        EditPersonalArea()
    }
}
