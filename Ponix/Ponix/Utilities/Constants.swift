//
//  Constants.swift
//  Ponix
//
//  Created by Andrew Smith on 11/12/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


let UNWIND = "unwindToChannel"
let TO_FEATURES = "podVC"


//URLS
let BASE_URL = "http://localhost:3000/"
let URL_SEQUENCES = "\(BASE_URL)sequences"
let URL_SEQUENCES_DOSE = "\(BASE_URL)sequences/dose"
let URL_SEQUENCES_DRAIN = "\(BASE_URL)sequences/drain"
let URL_SEQUENCES_INITIALIZE = "\(BASE_URL)sequences/initialize"


//DEFAULTS
let SEQUENCE_KEY = "sequence"
//HEADER
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"

]

let HEADER_TEXT = [
    "Content-Type": "text/html; charset=utf-8"
]
