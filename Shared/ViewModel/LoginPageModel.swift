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
    
//    Log Status...
    @AppStorage("log_status") var log_Status: Bool = false
    
//    Login Call....
    func Login(){
//        Do Action Here...
        withAnimation {
            log_Status = true
        }
    }
    
    func Register(){
//        Do action Here...
        withAnimation {
            log_Status = true
        }
    }
    
    func ForgotPassword(){
        //        Do action Here...
    }
    
}
