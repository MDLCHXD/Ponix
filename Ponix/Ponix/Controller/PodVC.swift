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
    @IBOutlet weak var recipePicker: UIPickerView!
    @IBOutlet weak var drainSidePicker: UIPickerView!
    
    @IBOutlet weak var startFeedingBtn: UIButton!
    @IBOutlet weak var startDrainingBtn: UIButton!
    @IBOutlet weak var shutdownBtn: UIButton!
    
    var plantSidePickerData: [String] = [String]()
    var recipePickerData: [String] = [String]()
    var drainSidePickerData: [String] = [String]()
    
    var plantSideSelected: String!
    var recipeSelected: String!
    var drainSideSelected: String!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: 375, height: 1130)
        plantSidePicker.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        plantSidePicker.layer.cornerRadius = 3.0
        
        
        /*headerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        headerView.layer.shadowRadius = 3.0
        headerView.layer.shadowColor = #colorLiteral(red: 0.1659789241, green: 0.8039215686, blue: 0.462745098, alpha: 1)
         */
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        plantSidePickerData = ["Left Side","Right Side","Both Sides"]
        recipePickerData = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5"]
        drainSidePickerData = ["Left Side","Right Side","Both Sides"]
        
        self.plantSidePicker.dataSource = self
        self.plantSidePicker.delegate = self
        
        self.recipePicker.dataSource = self
        self.recipePicker.delegate = self
        
        self.drainSidePicker.delegate = self
        self.drainSidePicker.dataSource = self
        
        if plantSideSelected == nil && recipeSelected == nil || drainSideSelected == nil{
            startFeedingBtn.isEnabled = false
            startFeedingBtn.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
            startDrainingBtn.isEnabled = false
            startDrainingBtn.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
            
        }
        
    }
    
    
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == plantSidePicker {
            return plantSidePickerData.count
        }
        else if pickerView == recipePicker {
            return recipePickerData.count
        }
        else {
          return drainSidePickerData.count
        }
      
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == plantSidePicker {
            return plantSidePickerData[row]
        }
        else if pickerView == recipePicker {
            return recipePickerData[row]
        }
        else {
            return drainSidePickerData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.string(forKey: "selected")
        if pickerView == plantSidePicker {
            plantSideSelected = plantSidePickerData[row] as String
        } else if pickerView == recipePicker {
            recipeSelected = recipePickerData[row] as String
        } else {
            drainSideSelected = drainSidePickerData[row] as String
        }
        
        if plantSideSelected != nil && recipeSelected != nil {
            startFeedingBtn.isEnabled = true
            startFeedingBtn.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.8039215686, blue: 0.4549019608, alpha: 1)
        }
        
        if drainSideSelected != nil {
            startDrainingBtn.isEnabled = true
            startDrainingBtn.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.8039215686, blue: 0.4549019608, alpha: 1)
        }
        

        
    }
    

    @IBAction func startFeedingBtnPressed(_ sender: Any) {
        print(plantSideSelected, recipeSelected)
    }
    
    @IBAction func startDrainingBtnPressed(_ sender: Any) {
        print(drainSideSelected)
    }
    
    @IBAction func shutdownBtnPressed(_ sender: Any) {
        
    }
    
    

 

}
