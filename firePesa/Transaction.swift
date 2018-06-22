//
//  Transaction.swift
//  firePesa
//
//  Created by Admin on 6/22/18.
//  Copyright © 2018 Rosário Pereira Fernandes. All rights reserved.
//

import UIKit
import Firebase

let transactionRef = Database.database().reference().child("firePesa/transactions")

func payment(msisdn:String, amount:String, reference:String, thirdPartyReference:String) throws -> DatabaseReference
{
    let user = Auth.auth().currentUser
    if user == nil {
        throw AuthErrorCode.requiresRecentLogin("Please sign in before starting a payment")
    } else {
        let paymentsRef = transactionRef.child("payments")
        let payment = Payment(msisdn: msisdn, amount: amount, reference: reference,
                              thirdPartyReference: thirdPartyReference, uid: user!.uid, timestamp: 0)
        let paymentKey = paymentsRef.childByAutoId().key
        paymentsRef.child(paymentKey).setValue(payment)
        paymentsRef.child(paymentKey).child("timestamp").setValue(ServerValue.timestamp())
        Analytics.logEvent(AnalyticsEventEcommercePurchase, parameters: [
            AnalyticsParameterValue: amount as NSObject,
            AnalyticsParameterCurrency: "MZN"
            ])
        return paymentsRef.child("results").child(paymentKey)
    }
}

func reversal(transactionId:String, amount:Float) throws -> DatabaseReference
{
    let user = Auth.auth().currentUser
    if user == nil {
        throw AuthErrorCode.requiresRecentLogin("Please sign in before ordering a refund")
    } else {
        let reversalsRef = transactionRef.child("reversals")
        let reversal = Reversal(transactionId: transactionId, amount: amount, uid: user!.uid, timestamp: 0)
        let reversalKey = reversalsRef.childByAutoId().key
        reversalsRef.child(reversalKey).setValue(reversal)
        reversalsRef.child(reversalKey).child("timestamp").setValue(ServerValue.timestamp())
        Analytics.logEvent(AnalyticsEventPurchaseRefund, parameters: [
            AnalyticsParameterValue: amount as NSObject,
            AnalyticsParameterCurrency: "MZN",
            AnalyticsParameterTransactionID: transactionId as NSObject
            ])
        return reversalsRef.child("results").child(reversalKey)
    }
}
