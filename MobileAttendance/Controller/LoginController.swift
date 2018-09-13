//
//  ViewController.swift
//  MobileAttendance
//
//  Created by MacOs on 8/26/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordVisibleButton: UIButton!
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var formView: UIView!
    
    var rememberMe :Bool = false
    
    
//    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 100, height: 100))
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        DBConnection.openDatabase()
        loginButton.layer.cornerRadius = 5
//        loginButton.clipsToBounds = true
        formView.layer.cornerRadius = 10
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func passwordVisibilityPresses(_ sender: UIButton) {
        
        if passwordField.isSecureTextEntry == true {
            passwordField.isSecureTextEntry = false
        } else {
            passwordField.isSecureTextEntry = true
        }
        
    }
    
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        
        if rememberMe == false {
            
            rememberMe = true
            
            UIView.transition(with: sender, duration: 0.1, options: .transitionCrossDissolve, animations: {sender.setBackgroundImage(UIImage(named: "Checked Checkbox"), for: .normal)}, completion: nil)

        } else {
            
            rememberMe = false
            
            UIView.transition(with: sender, duration: 0.1, options: .transitionCrossDissolve, animations: {sender.setBackgroundImage(UIImage(named: "Unchecked Checkbox"), for: .normal)}, completion: nil)

        }
        
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToHome", sender: self)
//        let usernameInput = userField.text!
//        let passwordInput = passwordField.text!
//
//        if LoginHelper.loginCheck(username: usernameInput, password: passwordInput) == true {
//
//            defaults.set(usernameInput, forKey: "username")
//            defaults.set(passwordInput, forKey: "password")
//
//            performSegue(withIdentifier: "goToHome", sender: self)
//
//        } else {
//
//            let alert = UIAlertController(title: "Gagal", message: "Salah!", preferredStyle: .alert)
//
//            let OkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//
//            alert.addAction(OkAction)
//
//            present(alert, animated: true, completion:  nil)
//
//        }
        
    }
    
}

