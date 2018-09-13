//
//  HomeController.swift
//  MobileAttendance
//
//  Created by MacOs on 8/26/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var absenButton: UIButton!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var fullscreenButton: UIButton!
    @IBOutlet weak var sideMenuButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dropDownView.isHidden = true
        sideMenuButton.contentMode = .center
        sideMenuButton.imageView?.contentMode = .scaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dropDownButtonPressed(_ sender: UIButton) {
        
        if dropDownView.isHidden == true {
            dropDownView.isHidden = false
        } else {
            dropDownView.isHidden = true
        }
        
        
    }
    
    @IBAction func notificationButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToProfile", sender: self)
        
        
        
    }
    @IBAction func sideBarButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func fullscreenButtonPressed(_ sender: UIButton) {
        
        
    }
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        
//        LoginHelper.loggingOut()
        
        performSegue(withIdentifier: "logoutSegue", sender: self)
        
    }
    
    @IBAction func sideMenuButtonPressed(_ sender: UIButton) {
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
