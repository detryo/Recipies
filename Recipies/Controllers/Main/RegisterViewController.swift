//
//  RegisterViewController.swift
//  Recipies
//
//  Created by Cristian Sedano Arenas on 24/04/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var conditionsSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        guard conditionsSwitch.isOn else {
            let controller = UIAlertController(title: "", message: "You have not accept the termns", preferredStyle: .alert)
            let alert = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            controller.addAction(alert)
            present(controller, animated: true, completion: nil)
            return
        }
        
        guard passwordTextField.text == repeatPasswordTextField.text else {
            let controller = UIAlertController(title: "", message: "Your password does't match", preferredStyle: .alert)
            let alert = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            controller.addAction(alert)
            present(controller, animated: true, completion: nil)
            return
        }
        
        guard let email = emailTextField.text, let pass = passwordTextField.text else {
            return
        }
        
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "fromRegisterToCategory", sender: self)
            }
        }
    }
}

extension RegisterViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.topConstraint.constant = CGFloat(240)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.topConstraint.constant = CGFloat(280)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.topConstraint.constant = CGFloat(280)
        textField.resignFirstResponder()
        return true
    }
}
