//
//  ViewController.swift
//  Recipies
//
//  Created by Cristian Sedano Arenas on 24/04/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var registerButton: CustomButton!
    @IBOutlet weak var logInButton: CustomButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "fromMainToCategory", sender: nil)
        }
        
        setUpView()
    }

    func setUpView() {
        logInButton.makeBacgroundWhiteWithBorder()
    }

}

