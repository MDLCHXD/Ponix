//
//  SequenceService.swift
//  Ponix
//
//  Created by Andrew Smith on 12/2/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import Foundation

class SequenceService {
    static let instance = SequenceService()
    
    public private(set) var initialize = ""
    public private(set) var dose = ""
    public private(set) var drain = ""
    
    func showSequenceData(initialize: String, dose: String, drain: String) {
        self.initialize = initialize
        self.dose = dose
        self.drain = drain
    }

}
