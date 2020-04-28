//
//  Recipe.swift
//  Recipies
//
//  Created by Cristian Sedano Arenas on 27/04/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

struct Recipe : Decodable {
    
    let name : String
    let description : String
    let price : Int
}
