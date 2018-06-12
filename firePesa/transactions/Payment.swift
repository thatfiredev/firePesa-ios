//
//  Payment.swift
//  firePesa
//
//  Created by Admin on 6/12/18.
//  Copyright © 2018 Rosário Pereira Fernandes. All rights reserved.
//

import UIKit

//msisdn, amount, reference, thirdPartyReference, uid, timestamp
class Payment: NSObject{
    var msisdn: String
    var amount: String
    var reference: String
    var thirdPartyReference: String
    var uid: String
    var timestamp: Int
    
    init(msisdn:String, amount:String, reference:String, thirdPartyReference:String, uid:String, timestamp:Int){
        self.msisdn = msisdn
        self.amount = amount
        self.reference = reference
        self.thirdPartyReference = thirdPartyReference
        self.uid = uid
        self.timestamp = timestamp
    }
    
    convenience override init(){
        self.init(msisdn: "", amount: "", reference: "", thirdPartyReference: "", uid: "", timestamp: 0)
    }
}
