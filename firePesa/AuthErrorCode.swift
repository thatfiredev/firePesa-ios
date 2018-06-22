//
//  AuthErrorCode.swift
//  firePesa
//
//  Created by Admin on 6/23/18.
//  Copyright © 2018 Rosário Pereira Fernandes. All rights reserved.
//

enum AuthErrorCode: Error {
    case requiresRecentLogin(String)
}
