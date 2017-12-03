//
//  StatsVC.swift
//  Ponix
//
//  Created by Andrew Smith on 11/19/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit

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
        
        returnDose()
        returnDrain()
        returnInitialize()
        
        

    }
    
    func makeRoundCorners() {
        farmTypeLabel.layer.cornerRadius = 3.0
        StatsView.layer.cornerRadius = 3.0
    }
    
    @IBAction func featuresPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_FEATURES, sender: nil)
    }
    
    func returnDose() {
       
        let initialize = SequenceService.instance.initialize
        let dose = SequenceService.instance.dose
        let drain = SequenceService.instance.drain
        PodService.instance.returnDose(dose: dose, completion: {(success) in
            if success {
                print(PodService.instance.sequenceResponseDose)
            }
        })
        
    }
    
    func returnDrain() {
        
        let initialize = SequenceService.instance.initialize
        let dose = SequenceService.instance.dose
        let drain = SequenceService.instance.drain
        PodService.instance.returnDrain(drain: drain, completion: {(success) in
            if success {
                print(PodService.instance.sequenceResponseDrain)
            }
        })
        
    }
    
    func returnInitialize() {
        
        let initialize = SequenceService.instance.initialize
        let dose = SequenceService.instance.dose
        let drain = SequenceService.instance.drain
        PodService.instance.returnInitalize(initialize: initialize, completion: {(success) in
            if success {
                print(PodService.instance.sequenceResponseInitialize)
            }
        })
        
    }
    
    

}
