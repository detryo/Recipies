//
//  LogInViewController.swift
//  Recipies
//
//  Created by Cristian Sedano Arenas on 24/04/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    @IBOutlet weak var topConstaint: NSLayoutConstraint!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        
         guard let email = emailTextField.text else {
            let controller = UIAlertController(title: "", message: "Invalid email", preferredStyle: .alert)
            let alert = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            controller.addAction(alert)
            present(controller, animated: true, completion: nil)
            return
        }
        
        guard let pass = passwordTextField.text else {
            let controller = UIAlertController(title: "", message: "Invalid password", preferredStyle: .alert)
            let alert = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            controller.addAction(alert)
            present(controller, animated: true, completion: nil)
            return
        }
        
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "fromLogInToCategory", sender: self)
            }
        }
    }
}

extension LogInViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.topConstaint.constant = CGFloat(240)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.topConstaint.constant = CGFloat(280)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.topConstaint.constant = CGFloat(280)
        textField.resignFirstResponder()
        return true
    }
}
