//
//  MenuVC.swift
//  Ponix
//
//  Created by Andrew Smith on 11/12/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()



    }

    @IBAction func addPodPressed(_ sender: Any) {
        let addPod = AddPodVC()
        addPod.modalPresentationStyle = .custom
        present(addPod, animated: true, completion: nil)
    }
    
}
