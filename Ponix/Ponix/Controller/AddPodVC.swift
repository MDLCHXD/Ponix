//
//  AddPodVC.swift
//  Ponix
//
//  Created by Andrew Smith on 11/20/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit

class AddPodVC: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddPodVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
