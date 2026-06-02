//
//  StoreModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 06/05/25.
//
import SwiftUI

@Observable
public class StoreModel {
    
    @ObservationIgnored var storeId: String
    var name: String
    var fruit: [Fruit]
    
    init(storeId: String,
         name: String,
         fruit: [Fruit]) {
        self.name = name
        self.fruit = fruit
        self.storeId = storeId
    }
    
    convenience init() {
        self.init(storeId: "13409877334",
                  name: "My Store",
                  fruit: [Fruit(name: "Apple"),
                          Fruit(name: "Banana"),
                          Fruit(name: "Pear")])
    }
    
    func addFruit(_ fruit: Fruit) {
        self.fruit.append(fruit)
    }
}
