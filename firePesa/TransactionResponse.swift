//
//  TransactionResponse.swift
//  firePesa
//
//  Created by Admin on 6/22/18.
//  Copyright © 2018 Rosário Pereira Fernandes. All rights reserved.
//

import UIKit

class TransactionResponse : NSObject {
    var code: String
    var transactionDescription: String
    var transactionId: String
    var conversationId: String
    var transactionStatus: String
    var isSuccessful: Bool
    
    init(code: String, description:String, transactionId:String, conversationId:String, transactionStatus:String, isSuccessful:Bool) {
        self.code = code
        self.transactionDescription = description
        self.transactionId = transactionId
        self.conversationId = conversationId
        self.transactionStatus = transactionStatus
        self.isSuccessful = isSuccessful
    }
    
    convenience override init() {
        self.init(code: "", description: "", transactionId: "", conversationId: "",
                  transactionStatus: "", isSuccessful: false)
    }
}
