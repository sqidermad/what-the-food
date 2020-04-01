//
//  HeightPickerController.swift
//  project Food Passion
//
//  Created by Evelyn on 02/05/19.
//  Copyright © 2019 Evelyn. All rights reserved.
//

import UIKit

class HeightPickerController: UIPickerView, UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component:
        Int, reusing view: UIView?) -> UIView{
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.transform = CGAffineTransform(rotationAngle: (90 * (.pi / 180 )))
         return view
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
