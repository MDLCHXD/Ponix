//
//  MenuVC.swift
//  Ponix
//
//  Created by Andrew Smith on 11/12/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60

    }

    @IBAction func addPodPressed(_ sender: Any) {
        let addPod = AddPodVC()
        addPod.modalPresentationStyle = .custom
        present(addPod, animated: true, completion: nil)
    }
    
}
