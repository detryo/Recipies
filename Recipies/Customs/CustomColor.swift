//
//  CustomColor.swift
//  Recipies
//
//  Created by Cristian Sedano Arenas on 24/04/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import ChameleonFramework

struct CustomColor {
    
    var customOrange : UIColor!
    
    init(whitFrame : CGRect) {
        
        let firstColor = UIColor(hexString: "FF8C2B", withAlpha: 1)
        let secodnColor = UIColor(hexString: "FF6322", withAlpha: 1)
        
        customOrange = UIColor(gradientStyle: .leftToRight, withFrame: whitFrame, andColors: [firstColor!, secodnColor!])
    }
    
    func getColor() -> UIColor {
        return customOrange
    }
}
