//
//  results.swift
//  submarine
//
//  Created by Ilya Vasilev on 01.02.2022.
//

import Foundation
class Results: Codable {
    
var name: String
var score: Int


init(name: String, score: Int) {
self.name = name
self.score = score
    
}
    
public enum CodingKeys: String, CodingKey {
case name, score
}
required public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: CodingKeys.self)

self.name = try container.decode(String.self, forKey: .name)
self.score = try container.decode(Int.self, forKey: .score)
//decoedIfPresent форма распаковки опционалов ( в иных случаях decode)
        
}
    
public func encode (to encoder: Encoder) throws {
var container = encoder.container(keyedBy: CodingKeys.self)
    
try container.encode(self.name, forKey: .name)
try container.encode(self.score, forKey: .score)
}
}
