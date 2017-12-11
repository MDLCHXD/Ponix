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

    
    @IBOutlet weak var rightValve0: UILabel!
    @IBOutlet weak var rightValve1: UILabel!
    @IBOutlet weak var middleValve: UILabel!
    @IBOutlet weak var leftValve0: UILabel!
    @IBOutlet weak var leftValve1: UILabel!
    
    @IBOutlet weak var rightValveState0: UILabel!
    @IBOutlet weak var rightValveState1: UILabel!
    @IBOutlet weak var middleValveState: UILabel!
    @IBOutlet weak var leftValveState0: UILabel!
    @IBOutlet weak var leftValveState1: UILabel!
    
    
    @IBOutlet weak var rightPumpLbl: UILabel!
    @IBOutlet weak var middlePumpLbl: UILabel!
    @IBOutlet weak var leftPumpLbl: UILabel!
    
    @IBOutlet weak var rightPumpStateLbl: UILabel!
    
    @IBOutlet weak var middlePumpStateLbl: UILabel!
    
    @IBOutlet weak var leftPumpStateLbl: UILabel!
    
    @IBOutlet weak var statScrollView: UIScrollView!
    @IBOutlet weak var farmTypeLabel: UILabel!
    @IBOutlet weak var StatsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statScrollView.delegate = self
        statScrollView.isScrollEnabled = true
        statScrollView.contentSize = CGSize(width: 375, height: 700)
        makeRoundCorners()
        
        /*returnDose()
        returnDrain()
        returnInitialize()*/
        //returnBots()
        returnBotRvO()
        returnBotRvI()
        returnBotLvI()
        returnBotLvO()
        returnBotMv()
        
        returnPumpLp()
        returnPumpMp()
        returnPumpRp()
        

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if #available(iOS 10.0, *) {
            let refreshControl = UIRefreshControl()
            let title = NSLocalizedString("Refreshing", comment: "Refreshing")
            refreshControl.attributedTitle = NSAttributedString(string: title)
            refreshControl.addTarget(self, action: #selector(refreshOptions(sender:)), for: .valueChanged)
            statScrollView.refreshControl = refreshControl
        }
        
    }
    
    @objc private func refreshOptions(sender: UIRefreshControl) {
        // Perform actions to refresh the content
        // ...
        // and then dismiss the control
        
        returnBotRvO()
        returnBotRvI()
        returnBotLvI()
        returnBotLvO()
        returnBotMv()
        
        returnPumpLp()
        returnPumpMp()
        returnPumpRp()
        print("refreshed")
        sender.endRefreshing()
    }
    
    
    func makeRoundCorners() {
        farmTypeLabel.layer.cornerRadius = 3.0
        StatsView.layer.cornerRadius = 3.0
    }
    
    @IBAction func featuresPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_FEATURES, sender: nil)
    }
    
    func returnDose() {
       
        let dose = SequenceService.instance.dose
        PodService.instance.returnDose(dose: dose, completion: {(success) in
            if success {
                print(PodService.instance.sequenceResponseDose)
            }
        })
        
    }
    
    func returnDrain() {
        
        let drain = SequenceService.instance.drain
        PodService.instance.returnDrain(drain: drain, completion: {(success) in
            if success {
                print(PodService.instance.sequenceResponseDrain)
            }
        })
        
    }
    
    func returnInitialize() {
        
        let initialize = SequenceService.instance.initialize
        PodService.instance.returnInitalize(initialize: initialize, completion: {(success) in
            if success {
                print(PodService.instance.sequenceResponseInitialize)
            }
        })
        
    }
    
    func returnBotRvO() {
        let id = String()
        let bot = String()
        let state = String()
        PodService.instance.returnBotRvO(id: id, bot: bot, state: state, completion: {(success) in
            if success {
                self.rightValve0.text = "\(PodService.instance.botsRvO)"
                self.rightValveState0.text = " State: \(PodService.instance.botsRvOState)"
            }
        })
    }
    
    func returnBotRvI() {
        let id = String()
        let bot = String()
        let state = String()
        PodService.instance.returnBotRvI(id: id, bot: bot, state: state, completion: {(success) in
            if success {
                self.rightValve1.text = "\(PodService.instance.botsRvI)"
                self.rightValveState1.text = " State: \(PodService.instance.botsRvIState)"
            }
        })
    }
    
    func returnBotLvO() {
        let id = String()
        let bot = String()
        let state = String()
        PodService.instance.returnBotLvO(id: id, bot: bot, state: state, completion: {(success) in
            if success {
                self.leftValve0.text = "\(PodService.instance.botsLvO)"
                self.leftValveState0.text = " State: \(PodService.instance.botsLvOState)"
            }
        })
    }
    func returnBotLvI() {
        let id = String()
        let bot = String()
        let state = String()
        PodService.instance.returnBotLvI(id: id, bot: bot, state: state, completion: {(success) in
            if success {
                self.leftValve1.text = "\(PodService.instance.botsLvI)"
                self.leftValveState1.text = " State: \(PodService.instance.botsLvIState)"
            }
        })
    }
    func returnBotMv() {
        let id = String()
        let bot = String()
        let state = String()
        PodService.instance.returnBotMv(id: id, bot: bot, state: state, completion: {(success) in
            if success {
                self.middleValve.text = "\(PodService.instance.botsMv)"
                self.middleValveState.text = " State: \(PodService.instance.botsMvState)"
            }
        })
    }
    func returnBots() {
        let valve = String()
        let pump = String()
        let peri = String()
        PodService.instance.returnBots(valve: valve, pump: pump, peri: peri, completion: {(success) in
            print("Valves: \(PodService.instance.allValves) Pumps: \(PodService.instance.allPumps) Peris: \(PodService.instance.allPeris)")
        })
    }
    
    
    func returnPumpLp() {
        let bot = String()
        let state = String()
       
        PodService.instance.returnPumpLp(bot: bot, state: state, completion: { (success) in
            self.leftPumpLbl.text = "\(PodService.instance.pumpLp)"
            self.leftPumpStateLbl.text = " State: \(PodService.instance.pumpLpState)"
        })
           
    }
    
    func returnPumpMp() {
        let bot = String()
        let state = String()
        
        PodService.instance.returnPumpMp(bot: bot, state: state, completion: { (success) in
            self.middlePumpLbl.text = "\(PodService.instance.pumpMp)"
            self.middlePumpStateLbl.text = " State: \(PodService.instance.pumpMpState)"        })
        
    }
    
    func returnPumpRp() {
        let bot = String()
        let state = String()
        
        PodService.instance.returnPumpRp(bot: bot, state: state, completion: { (success) in
            self.rightPumpLbl.text = "\(PodService.instance.pumpRp)"
            self.rightPumpStateLbl.text = " State: \(PodService.instance.pumpRpState)"
        })
        
    }
    
    

}
