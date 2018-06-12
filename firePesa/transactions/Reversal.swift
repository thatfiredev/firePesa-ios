//
//  Reversal.swift
//  firePesa
//
//  Created by Admin on 6/12/18.
//  Copyright © 2018 Rosário Pereira Fernandes. All rights reserved.
//

import UIKit

class Reversal: NSObject{
    var transactionId:String
    var amount:Float
    var uid:String
    var timestamp:Int
    
    init(transactionId:String, amount:Float, uid:String, timestamp:Int){
        self.transactionId = transactionId
        self.amount = amount
        self.uid = uid
        self.timestamp = timestamp
    }
    
    convenience override init() {
        self.init(transactionId: "", amount: 0, uid: "", timestamp: 0)
    }
}
