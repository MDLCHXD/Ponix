//
//  PodServices.swift
//  Ponix
//
//  Created by Andrew Smith on 12/2/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PodService {
    
    static let instance = PodService()
    let defaults = UserDefaults.standard
    
    public private(set) var sequenceResponseDose = ""
    public private(set) var sequenceResponseDrain = ""
    public private(set) var sequenceResponseInitialize = ""
    public private(set) var botsResponse = ""
    
    public private(set) var allValves = ""
    public private(set) var allPumps = ""
    public private(set) var allPeris = ""



    
    public private(set) var botsLvI = ""
    public private(set) var botsMv = ""
    public private(set) var botsRvI = ""
    public private(set) var botsLvO = ""
    public private(set) var botsRvO = ""
    
    public private(set) var botsLvIState = ""
    public private(set) var botsMvState = ""
    public private(set) var botsRvIState = ""
    public private(set) var botsLvOState = ""
    public private(set) var botsRvOState = ""
    
    public private(set) var pumpLp = ""
    public private(set) var pumpMp = ""
    public private(set) var pumpRp = ""
    
    public private(set) var pumpLpState = ""
    public private(set) var pumpMpState = ""
    public private(set) var pumpRpState = ""


    
    func returnDose(dose: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "Required parameters for dose sequence:": dose
        ]
        
        Alamofire.request(URL_SEQUENCES_DOSE, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER_TEXT).responseString { (response)
            in
            if response.result.error == nil {
                self.sequenceResponseDose = String(describing: response)
                //print(self.sequenceResponse)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func returnDrain(drain: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "Required parameters for drain sequence:": drain
        ]
        
        Alamofire.request(URL_SEQUENCES_DRAIN, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER_TEXT).responseString { (response)
            in
            if response.result.error == nil {
                self.sequenceResponseDrain = String(describing: response)
                //print(self.sequenceResponse)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func returnInitalize(initialize: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "Required parameters for initialize sequence:": initialize
        ]
        
        Alamofire.request(URL_SEQUENCES_INITIALIZE, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER_TEXT).responseString { (response)
            in
            if response.result.error == nil {
                self.sequenceResponseInitialize = String(describing: response)
                //print(self.sequenceResponse)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func returnBots(valve: String, pump: String, peri: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "valve": valve,
            "pump": pump,
            "peri": peri
        ]
        
        Alamofire.request(URL_BOTS, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response)
            in
            if response.result.error == nil {
                //self.botsResponse = String(describing: response)
                let responseJSON = response.result.value as! [String: AnyObject]
                let valves = String(describing: responseJSON["valve"]!)
                let pumps = String(describing: responseJSON["pump"]!)
                let peris = String(describing: responseJSON["peri"]!)
                
                self.allValves = valves
                self.allPumps = pumps
                self.allPeris = peris
                
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    

    func returnBotRvO(id: String, bot: String, state: String, completion: @escaping CompletionHandler) {
        let body: [String: Any] = [
            "_id": id,
            "bot": bot,
            "state": state
        ]
        
        Alamofire.request(URL_BOTS_RVO, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response)
            in
            if response.result.error == nil {
                
                let responseJSON = response.result.value as! [String: AnyObject]
                let bot = String(describing: responseJSON["bot"]!)
                let state = String(describing: responseJSON["state"]!)
                
                self.botsRvO = bot
                self.botsRvOState = state
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func returnBotRvI(id: String, bot: String, state: String, completion: @escaping CompletionHandler) {
        let body: [String: Any] = [
            "_id": id,
            "bot": bot,
            "state": state
        ]
        
        Alamofire.request(URL_BOTS_RVI, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response)
            in
            if response.result.error == nil {
                //print(self.botsRvO)
                let responseJSON = response.result.value as! [String: AnyObject]
                let bot = String(describing: responseJSON["bot"]!)
                let state = String(describing: responseJSON["state"]!)
                
                self.botsRvI = bot
                self.botsRvIState = state
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func returnBotLvO(id: String, bot: String, state: String, completion: @escaping CompletionHandler) {
        let body: [String: Any] = [
            "_id": id,
            "bot": bot,
            "state": state
        ]
        
        Alamofire.request(URL_BOTS_LVO, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response)
            in
            if response.result.error == nil {

                let responseJSON = response.result.value as! [String: AnyObject]
                let bot = String(describing: responseJSON["bot"]!)
                let state = String(describing: responseJSON["state"]!)

                self.botsLvO = bot
                self.botsLvOState = state
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func returnBotLvI(id: String, bot: String, state: String, completion: @escaping CompletionHandler) {
        let body: [String: Any] = [
            "_id": id,
            "bot": bot,
            "state": state
        ]
        
        Alamofire.request(URL_BOTS_LVI, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response)
            in
            if response.result.error == nil {
                //print(self.botsRvO)
                let responseJSON = response.result.value as! [String: AnyObject]
                let bot = String(describing: responseJSON["bot"]!)
                let state = String(describing: responseJSON["state"]!)

                self.botsLvI = bot
                self.botsLvIState = state
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    func returnBotMv(id: String, bot: String, state: String, completion: @escaping CompletionHandler) {
        let body: [String: Any] = [
            "_id": id,
            "bot": bot,
            "state": state
        ]
        
        Alamofire.request(URL_BOTS_Mv, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response)
            in
            if response.result.error == nil {
                //print(self.botsRvO)
                let responseJSON = response.result.value as! [String: AnyObject]
                let bots = String(describing: responseJSON["bot"]!)
                let state = String(describing: responseJSON["state"]!)
                self.botsMv = bots
                self.botsMvState = state
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func returnPumpLp(bot: String, state: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "bot": bot,
            "state": state
        ]
        
        Alamofire.request(URL_BOTS_PUMP_LP, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON
            { (response)
            in
                if response.result.error == nil {
                    let responseJSON = response.result.value as! [String: AnyObject]
                    let bot = String(describing: responseJSON["bot"]!)
                    let state = String(describing: responseJSON["state"]!)
                    
                    self.pumpLp = bot
                    self.pumpLpState = state
                    
                    print(self.pumpLp, self.pumpLpState)
                    completion(true)

                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
                
        }
    }
    
    func returnPumpMp(bot: String, state: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "bot": bot,
            "state": state
        ]
        
        Alamofire.request(URL_BOTS_PUMP_MP, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON
            { (response)
                in
                if response.result.error == nil {
                    let responseJSON = response.result.value as! [String: AnyObject]
                    let bot = String(describing: responseJSON["bot"]!)
                    let state = String(describing: responseJSON["state"]!)
                    
                    self.pumpMp = bot
                    self.pumpMpState = state
                    
                    print(self.pumpMp, self.pumpMpState)
                    completion(true)
                    
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
                
        }
    }
    
    func returnPumpRp(bot: String, state: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "bot": bot,
            "state": state
        ]
        
        Alamofire.request(URL_BOTS_PUMP_RP, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON
            { (response)
                in
                if response.result.error == nil {
                    let responseJSON = response.result.value as! [String: AnyObject]
                    let bot = String(describing: responseJSON["bot"]!)
                    let state = String(describing: responseJSON["state"]!)
                    
                    self.pumpRp = bot
                    self.pumpRpState = state
                    
                    print(self.pumpRp, self.pumpRpState)
                    completion(true)
                    
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
                
        }
    }


        
    
}
