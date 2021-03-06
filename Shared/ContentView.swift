//
//  ContentView.swift
//  Shared
//
//  Created by Michele Manniello on 27/11/21.
//

import SwiftUI

struct ContentView: View {
//    Log Status...
    @AppStorage("log_status") var log_Status: Bool = false
    var body: some View {
        Group{
            if log_Status{
                MainPage()
            }else{
                OnBoardingPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
