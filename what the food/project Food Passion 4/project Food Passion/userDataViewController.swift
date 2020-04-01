//
//  userDataViewController.swift
//  project Food Passion
//
//  Created by Evelyn on 04/05/19.
//  Copyright © 2019 Evelyn. All rights reserved.
//

import UIKit

class userDataViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == genderTextField {
            return gender.count
        } else if currentTextField == weightTextField {
            return weight.count
        } else if currentTextField == heightTextField{
            return height.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == genderTextField {
            return gender[row]
        } else if currentTextField == weightTextField {
            return weight[row]
        } else if currentTextField == heightTextField{
            return height[row]
        } else {
            return ""
        }
    }
    func setEnabledButton () {
        var name: String  = ""
        var gender: String = ""
        var dob: String = ""
        var weight: String = ""
        var height: String = ""
        name = nameTextField.text ?? ""
        gender = genderTextField.text ?? ""
        dob = dobTextField.text ?? ""
        weight = weightTextField.text ?? ""
        height = heightTextField.text ?? ""
        
        if !name.isEmpty && !gender.isEmpty && !dob.isEmpty && !weight.isEmpty && !height.isEmpty {
            //okButton.backgroundColor = .blue
            okButton.isEnabled = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
       setEnabledButton()
    }
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
    var datePicker = UIDatePicker()
    
    let gender: [String] = ["Female","Male"]
    let weight: [String] = ["40","41","42","43","44","45","46","47","48","49","50","51","52"]
    let height: [String] = ["150","151","152","153","154","155","156","157","158","159","160","161","162"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        createDatePicker()
        self.applyRoundCorner(okButton)
        okButton.isEnabled = false
        //okButton.backgroundColor = .gray
    }
    
    func applyRoundCorner(_ object:AnyObject) {
        object.layer.cornerRadius = object.frame.size.width / 50
        object.layer.masksToBounds = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == genderTextField {
            currentTextField.text = gender[row]
//            self.view.endEditing(true)
        } else if currentTextField == weightTextField {
            currentTextField.text = weight[row]
//            self.view.endEditing(true)
        } else if currentTextField == heightTextField {
            currentTextField.text = height[row]
//            self.view.endEditing(true)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        currentTextField = textField
        
        if currentTextField == genderTextField {
            createDone2Button()
            currentTextField.inputView = pickerView
        } else if currentTextField == weightTextField {
            createDone2Button()
            currentTextField.inputView = pickerView
        } else if currentTextField == heightTextField{
            createDone2Button()
            currentTextField.inputView = pickerView
        }
        
    }
    
    func createDatePicker(){
        datePicker.datePickerMode = .date
        dobTextField.inputView = datePicker
        createDoneButton()
    }
    
    func createDoneButton(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([doneButton], animated: true)
        dobTextField.inputAccessoryView = toolbar
    }

    func createDone2Button(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(done2Clicked))
        toolbar.setItems([doneButton], animated: false)
        currentTextField.inputAccessoryView = toolbar
    }
    
    @objc func done2Clicked() {
        self.view.endEditing(true)
    }
    
    @objc func doneClicked() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dobTextField.text = dateFormatter.string(from: datePicker.date)
            self.view.endEditing(true)
    }
    func textFieldShouldReturn() -> Bool {
            guard let valueOfText = nameTextField.text, let valueLength = nameTextField.text?.count else {
                return false
            }
            
            switch(valueLength) {
            case 0...3 :
                return false
            case 3...30 :
                print("\(valueOfText)")
                nameTextField.resignFirstResponder()
                return true
            default:
                fatalError()
            }
        }
    
    
    
}

