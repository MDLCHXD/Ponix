//
//  StatsVC.swift
//  Ponix
//
//  Created by Andrew Smith on 11/19/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit

class StatsVC: UIViewController {

    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var featuresButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func featuresPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_FEATURES, sender: nil)
    }
    
    

}
