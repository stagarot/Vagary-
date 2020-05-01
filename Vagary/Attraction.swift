//
//  Attraction.swift
//  AlbumCovers
//
//  Created by Sara Tagarot on 07/04/18.
//

import Foundation

//creates a struct with the values of the JSON file
struct Detail{
    let name: String
    let distance: Int
    let rating: Int
    let info: String
    let image: String
    
    //initiates the variables
    init(name:String, distance:Int, rating:Int, info:String, image:String){
        self.name = name
        self.distance = distance
        self.rating = rating
        self.info = info
        self.image = image
    }
}

//creates a struct dividing the name of the attractions to the rest of the information
struct Attraction {
    let attractions: [String]
    let details: [Detail]
    init(){
        self.attractions = []
        self.details = []
    }
    
    init(attractions: [String], details: [Detail]) { // default struct initializer
        self.attractions = attractions
        self.details = details
    }
}
extension Detail: Decodable{
    enum DetailKeys: String, CodingKey{
        case name = "name"
        case distance = "distance"
        case rating = "rating"
        case info = "info"
        case image = "image"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DetailKeys.self) // defining our (keyed) container
        let name: String = try container.decode(String.self, forKey: .name) // extracting the data
        let distance: Int = try container.decode(Int.self, forKey: .distance) // extracting the data
        let rating: Int = try container.decode(Int.self, forKey: .rating) // extracting the data
        let info: String = try container.decode(String.self, forKey: .info) // extracting the data
        let image: String = try container.decode(String.self, forKey: .image) // extracting the data
        self.init(name:name, distance:distance, rating:rating, info:info, image:image) // initializing our struct
    }
}

extension Attraction: Decodable {
    enum AttractionKeys: String, CodingKey{
        case attractions = "attractions"
        case details = "details"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AttractionKeys.self) // defining our (keyed) container
        let attractions: [String] = try container.decode([String].self, forKey: .attractions) // extracting the data
        let details: [Detail] = try container.decode([Detail].self, forKey: .details) // extracting the data
        
        self.init(attractions:attractions, details: details) // initializing our struct
    }
}
