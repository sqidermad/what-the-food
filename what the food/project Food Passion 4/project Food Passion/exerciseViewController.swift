//
//  exerciseViewController.swift
//  project Food Passion
//
//  Created by Evelyn on 09/05/19.
//  Copyright © 2019 Evelyn. All rights reserved.
//

import UIKit

class exerciseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var timeTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    var pickerView = UIPickerView()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return time.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return time[row]
    }
    let time: [String] = ["Very Rarely","Rarely","Often","Very Often"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        createDoneButton()
        timeTextField.inputView = pickerView
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        timeTextField.text = time[row]
    }
    
    func createDoneButton(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([doneButton], animated: true)
        timeTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneClicked() {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
