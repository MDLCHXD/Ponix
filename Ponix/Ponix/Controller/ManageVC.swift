//
//  PodVC.swift
//  Ponix
//
//  Created by Andrew Smith on 11/12/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit

@IBDesignable
class ManageVC: UIViewController, UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var confirmationView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checklistLabel: UILabel!
    @IBOutlet weak var feedLabel: UILabel!
    @IBOutlet weak var plantDrainSideLabel: UILabel!
    @IBOutlet weak var recipeLabel: UILabel!
    
    @IBOutlet weak var plantSidePicker: UIPickerView!
    @IBOutlet weak var recipePicker: UIPickerView!
    @IBOutlet weak var drainSidePicker: UIPickerView!
    
    @IBOutlet weak var startFeedingBtn: UIButton!
    @IBOutlet weak var startDrainingBtn: UIButton!
    @IBOutlet weak var shutdownBtn: UIButton!
    @IBOutlet weak var confirmationButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
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
        confirmationView.isHidden = true
        scrollView.contentSize = CGSize(width: 375, height: 1130)
        plantSidePicker.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        plantSidePicker.layer.cornerRadius = 3.0
        
        let color = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
        let textColor = UIColor(red: 171/255, green: 198/255, blue: 107/255, alpha: 1)
        UITabBar.appearance().barTintColor = color
        UITabBar.appearance().tintColor = textColor
        /*headerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        headerView.layer.shadowRadius = 3.0
        headerView.layer.shadowColor = #colorLiteral(red: 0.1659789241, green: 0.8039215686, blue: 0.462745098, alpha: 1)
         */
        
        
        
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
        confirmationView.isHidden = false
        titleLabel.text = "FEED PLANTS"
        feedLabel.text = "SELECTED TO FEED"
        checklistLabel.text = "Before feeding the plants, check on the following items: \n - Nutrient and pH solution levels should be filled above the marked lines \n - NFT pump switches should be on \n - All seedlings should be in place for \(plantSideSelected!) \n"
        plantDrainSideLabel.isHidden = false
        plantDrainSideLabel.text = plantSideSelected
        recipeLabel.isHidden = false
        recipeLabel.text = recipeSelected
        confirmationButton.setTitle("YES", for: .normal)
        confirmationButton.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.8039215686, blue: 0.462745098, alpha: 1)

        
    }
    
    @IBAction func startDrainingBtnPressed(_ sender: Any) {
        print(drainSideSelected)
        confirmationView.isHidden = false
        titleLabel.text = "DRAIN PLANTS"
        checklistLabel.text = "Are you sure you want to drain your plants?"
        feedLabel.text = "SELECTED TO DRAIN"
        plantDrainSideLabel.isHidden = false
        plantDrainSideLabel.text = drainSideSelected
        recipeLabel.isHidden = true
        confirmationButton.setTitle("DRAIN", for: .normal)
        confirmationButton.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.8039215686, blue: 0.462745098, alpha: 1)
    }
    
    @IBAction func confirmationBtnPressed(_ sender: Any) {
        confirmationView.isHidden = true
    }
    @IBAction func cancelBtnPressed(_ sender: Any) {
        confirmationView.isHidden = true
    }
    @IBAction func shutdownBtnPressed(_ sender: Any) {
        confirmationView.isHidden = false
        titleLabel.text = "SHUTDOWN SYSTEM"
        checklistLabel.text = "Are you sure you want to shutdown your system?"
        feedLabel.text = "SELECTED TO SHUTDOWN"
        plantDrainSideLabel.isHidden = true
        recipeLabel.isHidden = true
        confirmationButton.backgroundColor = #colorLiteral(red: 0.7490196078, green: 0.4509803922, blue: 0.4705882353, alpha: 1)
        confirmationButton.setTitle("SHUTDOWN", for: .normal)
        
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
 

}
