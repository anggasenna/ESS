//
//  PickerViewController.swift
//  MobileAttendance
//
//  Created by MacOs on 9/3/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import UIKit
import PickerView

class PickerViewController: UIViewController, PickerViewDataSource, PickerViewDelegate {
    
    let klubPicker = PickerView()
    let klub = ["Arsenal", "Chelsea", "Liverpool", "Manchester City", "Manchester United"]
    
    func pickerViewHeightForRows(_ pickerView: PickerView) -> CGFloat {
        return 30.0
    }
    
    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        return klub.count
    }
    
    func pickerView(_ pickerView: PickerView, titleForRow row: Int, index: Int) -> String {
        return klub[row]
    }
    
    func pickerView(_ pickerView: PickerView, didSelectRow row: Int, index: Int) {
        let selectedItem = klub[row]
        print("\(selectedItem)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        klubPicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(klubPicker)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
