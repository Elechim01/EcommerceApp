//
//  LoginPageModel.swift
//  EcommerceAppKit (iOS)
//
//  Created by Michele Manniello on 27/11/21.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    
//    Login Properties...
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassowrd: Bool = false
    
//    Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
//    Login Call....
    func Login(){
//        Do Action Here...
    }
    
    func Register(){
//        Do action Here...
    }
    
    func ForgotPassword(){
        //        Do action Here...
    }
    
}
