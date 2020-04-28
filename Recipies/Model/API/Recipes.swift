//
//  Recipes.swift
//  Recipies
//
//  Created by Cristian Sedano Arenas on 27/04/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

public class Recipes {
    
    @Published var recipe = [Recipe]()
    
    init() {
        loadRecipe()
        sort()
    }
    
    func loadRecipe() {
        
        if let fileLocation = Bundle.main.url(forResource: "recipes", withExtension: "json") {
            
            do {
                
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Recipe].self, from: data)
                
                self.recipe = dataFromJson
                
            } catch {
                print(error)
            }
        }
    }
    
    func sort() {
        
        self.recipe = self.recipe.sorted(by: { $0.name < $1.name })
    }
}
