//
//  Attractions.swift
//
//
//  Copyright © 2017 Sara Tagarot. All rights reserved.
//

import Foundation

// MARK: - JSON File
/// A  model based upon the Attractions definition in the JSON
/*
    {
    "Pyramid of the Sun": {
        “distance”: 10,
        “rating”: 7,
        “info”: ”The Pyramid of the Sun is one of the largest structures in the Western Hemisphere , believed to have been constructed about 200 CE. The pyramid rises 216 feet (66 m) above ground level, and it measures approximately 720 by 760 feet (220 by 230 m) at its base.”
        }
    }
 */

struct Attractions {
    let name: String
    let distance: Int
    let rating: Int
    let info: String

    // Basic functionality doesn't need this
    // This is the default functionality
    
    init(name: String, distance: Int, rating: Int, info: String) {
        self.name = name
        self.distance = distance
        self.rating = rating
        self.info = info
    }
}

extension Attractions: CustomStringConvertible {
    var description: String {
        return "\(name):\(distance):\(rating):[\(info)]"
    }
}
