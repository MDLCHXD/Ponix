//
//  StatsVC.swift
//  Ponix
//
//  Created by Andrew Smith on 11/19/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit
import Alamofire
@IBDesignable
class MonitorVC: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var featuresButton: UIButton!
    @IBOutlet weak var statScrollView: UIScrollView!
    @IBOutlet weak var farmTypeLabel: UILabel!
    @IBOutlet weak var StatsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statScrollView.delegate = self
        statScrollView.isScrollEnabled = true
        statScrollView.contentSize = CGSize(width: 375, height: 700)
        makeRoundCorners()
        
        
        
        

    }
    
    func makeRoundCorners() {
        farmTypeLabel.layer.cornerRadius = 3.0
        StatsView.layer.cornerRadius = 3.0
    }
    
    @IBAction func featuresPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_FEATURES, sender: nil)
    }
    
    

}
