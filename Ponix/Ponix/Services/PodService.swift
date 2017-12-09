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

    
    public private(set) var botsLvI = ""
    public private(set) var botsMv = ""
    public private(set) var botsRvI = ""
    public private(set) var botsLvO = ""
    public private(set) var botsRvO = ""
    
    public private(set) var pumpLp = ""
    public private(set) var pumpMp = ""
    public private(set) var pumpRp = ""


    
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
        
        Alamofire.request(URL_BOTS, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response)
            in
            if response.result.error == nil {
                self.botsResponse = String(describing: response)
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
                self.botsRvO = String(describing: response)
                //print(self.botsRvO)
                let responseJSON = response.result.value as! [String: AnyObject]
                let bot = String(describing: responseJSON["bot"])
                let state = String(describing: responseJSON["state"])
                print("Your id is \(bot)" + "Your state is \(state)")
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
                self.botsRvI = String(describing: response)
                //print(self.botsRvO)
                let responseJSON = response.result.value as! [String: AnyObject]
                let bot = String(describing: responseJSON["bot"])
                let state = String(describing: responseJSON["state"])
                print("Your bot is \(bot)" + "Your state is \(state)")
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
                self.botsLvO = String(describing: response)
                //print(self.botsRvO)
                let responseJSON = response.result.value as! [String: AnyObject]
                let bot = String(describing: responseJSON["bot"])
                let state = String(describing: responseJSON["state"])
                print("Your bot is \(bot)" + "Your state is \(state)")
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
                self.botsLvI = String(describing: response)
                //print(self.botsRvO)
                let responseJSON = response.result.value as! [String: AnyObject]
                let bot = String(describing: responseJSON["bot"])
                let state = String(describing: responseJSON["state"])
                print("Your bot is \(bot)" + "Your state is \(state)")
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
                self.botsMv = String(describing: response)
                //print(self.botsRvO)
                let responseJSON = response.result.value as! [String: AnyObject]
                let bot = String(describing: responseJSON["bot"])
                let state = String(describing: responseJSON["state"])
                print("Your bot is \(bot)" + "Your state is \(state)")
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
  


        
    
}
