//
//  PlantSidePickerView.swift
//  Ponix
//
//  Created by Andrew Smith on 11/15/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit

class PlantSidePickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var plantSidePicker: UIPickerView!
    var plantSidePickerData: [[String]] = [[String]]()
    
    
    override func awakeFromNib() {
       // plantSidePicker.delegate = self
       // plantSidePicker.dataSource = self
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return plantSidePickerData.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return plantSidePickerData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.string(forKey: "selected")
    }
    
    
    
    
  

}
