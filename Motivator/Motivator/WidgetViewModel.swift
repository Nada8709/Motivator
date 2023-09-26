//
//  WidgetViewModel.swift
//  Motivator
//
//  Created by NadaAshraf on 25/09/2023.
//

import SwiftUI
final class WidgetViewModel{
    
    @AppStorage("Number_Key") var PushUpsCounter = 0
    @AppStorage("Number_Key") var SitUpsCounter = 0


    func getPushUps(){}
    func getsitUps(){}
  
    func increasePushUpsCounter(){
        PushUpsCounter += 1
    }
    
    func increaseSitsUpsCounter(){
        SitUpsCounter += 1
    }
    
    func getPushUpsCounter() -> String{
        return String(PushUpsCounter)
    }
    
    func getSitsUpsCounter() -> String{
        return String(SitUpsCounter)
    }
}
