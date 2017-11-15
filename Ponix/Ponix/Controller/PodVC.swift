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
   
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: 375, height: 872)
        
      /*  headerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        headerView.layer.shadowRadius = 3.0
        headerView.layer.shadowColor = #colorLiteral(red: 0.1659789241, green: 0.8039215686, blue: 0.462745098, alpha: 1)*/
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        

    }

    

}
