//
//  extension + codable.swift
//  submarine
//
//  Created by Ilya Vasilev on 01.02.2022.
//

import Foundation
class optionGame: Codable {
    
var name: String
var price: Int
var quantity : Int
    var selected : Int
var isLiked: Bool?
//var date = Date()

    init(name: String, quantity: Int, price: Int, selected : Int, isLiked: Bool?) {
self.name = name
self.quantity = quantity
        self.price = price
        self.selected = selected
        self.isLiked = isLiked
       
}

    
public enum CodingKeys: String, CodingKey {
case name, price, quantity, selected, isLiked
}
required public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: CodingKeys.self)

self.name = try container.decode(String.self, forKey: .name)
self.price = try container.decode(Int.self, forKey: .price)
self.quantity = try container.decode(Int.self, forKey: .quantity)
self.selected = try container.decode(Int.self, forKey: .selected)
self.isLiked = try container.decodeIfPresent(Bool.self, forKey: .isLiked)
 
}

    
public func encode (to encoder: Encoder) throws {
var container = encoder.container(keyedBy: CodingKeys.self)
    
try container.encode(self.name, forKey: .name)
try container.encode(self.price, forKey: .price)
    try container.encode(self.quantity, forKey: .quantity)
    try container.encode(self.selected, forKey:.selected)
    try container.encode(self.isLiked, forKey: .isLiked)
//    try container.encode(self.date, forKey:.date)
}
    
}
