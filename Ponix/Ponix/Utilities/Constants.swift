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

let URL_BOTS = "\(BASE_URL)bots"
let URL_BOTS_LVI = "\(BASE_URL)bots/LvI"
let URL_BOTS_Mv = "\(BASE_URL)bots/Mv"
let URL_BOTS_RVI = "\(BASE_URL)bots/RvI"
let URL_BOTS_LVO = "\(BASE_URL)bots/LvO"
let URL_BOTS_RVO = "\(BASE_URL)bots/RvO"

let URL_BOTS_PUMP_LP = "\(BASE_URL)bots/Lp"
let URL_BOTS_PUMP_MP = "\(BASE_URL)bots/Mp"
let URL_BOTS_PUMP_RP = "\(BASE_URL)bots/Rp"


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
