//
//  Superhero.swift
//  TableAndCollection
//
//  Created by ThisObey Studio on 21/10/18.
//  Copyright © 2018 ThisObey Studio. All rights reserved.
//

import Foundation

// MARK: - Superhero

struct Superhero {
    
    // MARK: Properties

    let name: String
    let imageName: String
    
    static let NameKey = "NameKey"
    static let ImageNameKey = "ImageNameKey"
    
    // MARK: Initializer
    
    // Generate a Superhero from a 'n' entry dictionary
    
    init(dictionary: [String : String]) {
        self.name = dictionary[Superhero.NameKey]!
        self.imageName = dictionary[Superhero.ImageNameKey]!
    }
}

// MARK: - Superhero (All Superheroes)

/**
 * This extension adds static variable allSuperheroes.
 * An array of Superhero objects
 */

extension Superhero {
    
    // Generate an array full of all of the Superheroes in
    static var allSuperheroes: [Superhero] {
        
        var superheroesArray = [Superhero]()
        
        for d in Superhero.localSuperheroesData() {
            superheroesArray.append(Superhero(dictionary: d))
        }
        
        return superheroesArray
    }
    
    static func localSuperheroesData() -> [[String : String]] {
        return [
            [Superhero.NameKey : "Black Widow", Superhero.ImageNameKey : "black_widow"],
            [Superhero.NameKey : "Bucky", Superhero.ImageNameKey : "bucky"],
            [Superhero.NameKey : "Captain America", Superhero.ImageNameKey : "captain_america"],
            [Superhero.NameKey : "Doctor Strange", Superhero.ImageNameKey : "doctor_strange"],
            [Superhero.NameKey : "Drax", Superhero.ImageNameKey : "drax"],
            [Superhero.NameKey : "Falcon", Superhero.ImageNameKey : "falcon"],
            [Superhero.NameKey : "Gamora", Superhero.ImageNameKey : "gamora"],
            [Superhero.NameKey : "Groot", Superhero.ImageNameKey : "groot"],
            [Superhero.NameKey : "Hulk", Superhero.ImageNameKey : "hulk"],
            [Superhero.NameKey : "Iron Man", Superhero.ImageNameKey : "iron_man"],
            [Superhero.NameKey : "Iron Spider", Superhero.ImageNameKey : "iron_spider"],
            [Superhero.NameKey : "Mantis", Superhero.ImageNameKey : "mantis"],
            [Superhero.NameKey : "Rocket", Superhero.ImageNameKey : "rocket"],
            [Superhero.NameKey : "Scarlet Witch", Superhero.ImageNameKey : "scarlet_witch"],
            [Superhero.NameKey : "Star Lord", Superhero.ImageNameKey : "star_lord"],
            [Superhero.NameKey : "Thor", Superhero.ImageNameKey : "thor"],
            [Superhero.NameKey : "Vision", Superhero.ImageNameKey : "vision"],
            [Superhero.NameKey : "War Machine", Superhero.ImageNameKey : "war_machine"]
        ]
    }
}

