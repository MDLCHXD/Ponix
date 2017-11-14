//
//  PodVC.swift
//  Ponix
//
//  Created by Andrew Smith on 11/12/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit

@IBDesignable
class PodVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var menuButton: UIButton!
   
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // scrollView.delegate = self
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())


    }

    

}
