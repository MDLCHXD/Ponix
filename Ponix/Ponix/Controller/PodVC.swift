//
//  PodVC.swift
//  Ponix
//
//  Created by Andrew Smith on 11/12/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit

@IBDesignable
class PodVC: UIViewController, UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var plantSidePicker: UIPickerView!
    @IBOutlet weak var drainSidePicker: UIPickerView!
    
    
    var plantSidePickerData: [String] = [String]()
    var drainSidePickerData: [String] = [String]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: 375, height: 872)
        
        //self.drainSidePicker.delegate = self
        //self.drainSidePicker.dataSource = self
        
        /*headerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        headerView.layer.shadowRadius = 3.0
        headerView.layer.shadowColor = #colorLiteral(red: 0.1659789241, green: 0.8039215686, blue: 0.462745098, alpha: 1)
         */
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        plantSidePickerData = ["Left Side","Right Side","Both Sides"]
        drainSidePickerData = ["Left Side","Right Side","Both Sides"]
        self.plantSidePicker.dataSource = self
        self.plantSidePicker.delegate = self
        
        
    }
    
    
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      
        return plantSidePickerData.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return plantSidePickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.string(forKey: "selected")
    }
    

   
    

    

 

}
