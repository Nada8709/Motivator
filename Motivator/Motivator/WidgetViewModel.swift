//
//  WidgetViewModel.swift
//  Motivator
//
//  Created by NadaAshraf on 25/09/2023.
//

import SwiftUI
final class WidgetViewModel: ObservableObject{
    
    @AppStorage("PushUpsCounter") var PushUpsCounter = 0
    @AppStorage("SitUpsCounter") var SitUpsCounter = 0
    @AppStorage("BrushTeethCounter") var BrushTeethCounter = 0

    func increasePushUpsCounter(){
        PushUpsCounter += 1
    }
    
    func decreasePushUpsCounter(){
        PushUpsCounter -= 1
    }
    
    func increaseSitsUpsCounter(){
        SitUpsCounter += 1
    }
    
    func decreaseSitsUpsCounter(){
        SitUpsCounter -= 1
    }
    
    func increaseBrushTeethCounter(){
        BrushTeethCounter += 1
    }
    
    func decreaseBrushTeethCounter(){
        BrushTeethCounter -= 1
    }
}
