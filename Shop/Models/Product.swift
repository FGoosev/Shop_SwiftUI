//
//  Product.swift
//  Shop
//
//  Created by Alexandr Gusev on 18.06.2022.
//

import Foundation

struct Product: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Adidas Forum Exhibit Low", image: "1", price: 11999),
                   Product(name: "Adidas Niteball", image: "2", price: 10990),
                   Product(name: "Adidas Forum Low", image: "3", price: 8999),
                   Product(name: "Adidas Forum Low", image: "4", price: 8999),
                   Product(name: "Adidas Supercourt", image: "5", price: 10790),
                   Product(name: "Adidas Ozweego", image: "6", price: 13999),
                   Product(name: "Adidas Ozweego", image: "7", price: 13999),
                   Product(name: "Adidas Busenits", image: "8", price: 7990),
                   Product(name: "Adidas Forum Low", image: "9", price: 8999),
                   Product(name: "Adidas 8K", image: "10", price: 3200),
                   Product(name: "Adidas Cloudfoam", image: "11", price: 2790),
                   Product(name: "Adidas ZX 10000", image: "12", price: 12490),
                   Product(name: "Adidas Retropy E5", image: "13", price: 15999),
                   Product(name: "Adidas Climacool Adv", image: "14", price: 11990),
                   Product(name: "Adidas EQT Support", image: "15", price: 4440),
                   Product(name: "Adidas Forum Low W", image: "16", price: 11990)]
