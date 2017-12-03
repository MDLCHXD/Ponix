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



    
    
    
    var sequenceResult: String {
        get {
            return defaults.value(forKey: SEQUENCE_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: SEQUENCE_KEY)
        }
    }
    
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
    
   /* func splitSequenceData(components: String) -> String {
    //{dose = (Week1, "Left Side"); drain = (target); initialize = ();}
    }*/
}
