//
//  ReimburseController.swift
//  MobileAttendance
//
//  Created by MacOs on 8/27/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import Foundation
import UIKit
import DatePickerDialog


class ReimburseController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    
    
    
    
    

    @IBOutlet weak var jumlahTextField: UITextField!
    @IBOutlet weak var kategoriPicker: UIPickerView!
    @IBOutlet weak var tagPicker: UIPickerView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var pickerButton: UIButton!
    @IBOutlet weak var pickerLabel: UILabel!
    
    
    var kategoriValue = ""
    var tagValue = ""
    var tanggalValue = ""
    var picker = UIPickerView()
    
    
    let alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
    
    let kategoriData = ["Transportasi", "Konsumsi", "Telekmunikasi", "Operasional"]
    let tagData = ["Dinas", "Meeting", "Daily"]
    
    /*
    func pickerViewHeightForRows(_ pickerView: PickerView) -> CGFloat {
        return 50.0
    }
    
    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        return kategoriData.count
    }
    
    func pickerView(_ pickerView: PickerView, titleForRow row: Int, index: Int) -> String {
        return kategoriData[index]
    }
    
    func pickerView(_ pickerView: PickerView, didSelectRow row: Int, index: Int) {
        pickerLabel.text = kategoriData[row]
        examplePicker.isHidden = true
    }
     */
    
    
    // MARK: - PickerView default
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == kategoriPicker {
            return kategoriData.count
        } else {
            return tagData.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == kategoriPicker {
            return kategoriData[row]
        } else {
            return tagData[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == kategoriPicker {
            kategoriValue = kategoriData[row]
        } else {
            tagValue = tagData[row]
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        kategoriPicker.delegate = self
//        kategoriPicker.dataSource = self
        
//        tagPicker.delegate = self
//        tagPicker.dataSource = self
        alert.isModalInPopover = true
        
        picker.delegate = self
        picker.dataSource = self
        
        picker.frame.origin.x = 50
        picker.frame.origin.y = 200
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(alet: UIAlertAction!) -> Void in
            print("jebret")
        })
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        
        
//        view.addSubview(picker)
        
//        examplePicker.dataSource = self
//        examplePicker.delegate = self
        
//        examplePicker.isHidden = true
        
        jumlahTextField.keyboardType = .numberPad

        // Do any additional setup after loading the view.
    }
        

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendFormData" {
            
            let secondVC = segue.destination as! DataController
            
            secondVC.jumlah = jumlahTextField.text!
            secondVC.kategori = kategoriValue
            secondVC.tag = tagValue
            secondVC.tanggal = tanggalValue
        }
    }
    
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyy"
        let strDate = dateFormatter.string(from: sender.date)
        tanggalValue = strDate
    }
    
    @IBAction func dateField(_ sender: UITextField) {
        
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date){
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                self.dateTextField.text = formatter.string(from: dt)
            }
        }
        
    }
    
    @IBAction func pickerButtonPressed(_ sender: UIButton) {
        
        print("pencet")
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "sendFormData", sender: self)
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
