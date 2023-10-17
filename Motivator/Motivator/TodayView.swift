//
//  TodayView.swift
//  Motivator
//
//  Created by NadaAshraf on 13/09/2023.
//

import SwiftUI
import WidgetKit
struct TodayView: View {
    @AppStorage("PushUpsCounter") var pushUpsCounter = 0
    @AppStorage("SitUpsCounter") var sitUpsCounter = 0
    @AppStorage("BrushTeethCounter") var brushTeethCounter = 0

    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    @StateObject var viewModel = WidgetViewModel()
    
    private var currentWidgets = [
        WidgetModel(title: "Pushups", borderColor: UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1), championImage: "champion", calenderImage: "calender", number: "0", calenderNumber: "9", championNumber: "12", backGroundColor: Color.white),
        
        WidgetModel(title: "Sit-ups", borderColor: UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 1), championImage: "greenChampion", calenderImage: "greenCalender", number: "0", calenderNumber: "12", championNumber: "20", backGroundColor: Color.white),
        
        WidgetModel(title: "Brush teeth", borderColor: UIColor.white, championImage: "champion", calenderImage: "calender", number: "0", calenderNumber: "9", championNumber: "12", backGroundColor: Color.orange),
        
        WidgetModel(title: "", borderColor: UIColor.white, championImage: "champion", calenderImage: "calender", number: "25", calenderNumber: "9", championNumber: "12", backGroundColor: Color("Grey6")),
        
    ]
    
    var body: some View {
        ZStack{
            Color("Grey6")
            VStack{
                Text(getTodaysDate())
                    .font(.system(size: 40, weight: .bold, design: .none))
                    .foregroundColor(Color("Grey3"))
                    .padding(.bottom, 24.0)
                
                HStack{
                    pushUpsWidget
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("Grey4"),lineWidth: 1)
                        )
                    
                    sitUpsWidget
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("Grey4"),lineWidth: 1)
                        )
                }.padding(.bottom, 14)
                
                HStack{
                    brushTeethWidget
                        .background(Color.orange)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("Grey4"),lineWidth: 1)
                        )
                    
                    Image("plusCircle")
                        .padding(58)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("Grey4"),lineWidth: 1)
                        )
                }
                Spacer()
            }.padding(.horizontal, 16)
                .padding(.vertical, 100)
        }
        .ignoresSafeArea()
        
    }
    
    var pushUpsWidget: some View{
        VStack(spacing: 10) {
            Text("Pushups")
                .font(.system(size: 27, weight: .medium))
                .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)))
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
            
            HStack(spacing: 27){
                Button(action: {
                    
                }) { Image("minus")
                        .onTapGesture {
                            if viewModel.isInSameDay(lastAddedDate: viewModel.savedPushUps.last?.date ?? Date()){
                                let temp = (viewModel.savedPushUps.last?.counter ?? 1) - 1
                                 if viewModel.savedPushUps.count > 0 {
                                     viewModel.savedPushUps.removeLast()
                                 }
                                 viewModel.savedPushUps.append(CounterModels(counter: temp, date: Date()))
                            }
                        }
                }
                
                Text(String(pushUpsCounter))
                    .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)).opacity(0.5))
                    .font(.system(size: 36, weight: .heavy))
                
                Image("plus").onTapGesture {
                    pushUpsCounter += 1
                    viewModel.checkTime()
                    WidgetCenter.shared.reloadAllTimelines()

                }
            }.padding(.bottom, 10)
            
            HStack{
                HStack(spacing: 5){
                    Image("calender")
                    Text("0")
                        .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)).opacity(0.5))
                        .font(.system(size: 24))
                }.padding(.leading, 20)
                
                Spacer()
                
                HStack(spacing: 3){
                    Image("champion")
                    Text("12")
                        .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)).opacity(0.5))
                        .font(.system(size: 24))
                }.padding(.trailing, 10)
            }
            .padding(.bottom, 16.0)
        }
    }
    
    var sitUpsWidget: some View{
        VStack(spacing: 10) {
            Text("Situps")
                .font(.system(size: 27, weight: .medium))
                .foregroundColor(Color(UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 1)))
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
            
            HStack(spacing: 27){
                Button(action: {
                    
                }) { Image("minus")
                        .onTapGesture {
                            if viewModel.isInSameDay(lastAddedDate: viewModel.savedSitUps.last?.date ?? Date()){
                                let temp = (viewModel.savedSitUps.last?.counter ?? 1) - 1
                                 if viewModel.savedSitUps.count > 0 {
                                     viewModel.savedSitUps.removeLast()
                                 }
                                 viewModel.savedSitUps.append(CounterModels(counter: temp, date: Date()))
                            }
                        }
                }
                Text(String(viewModel.savedSitUps.last?.counter ?? 0))
                    .foregroundColor(Color(UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 1)).opacity(0.5))
                    .font(.system(size: 36, weight: .heavy))
                Image("plus").onTapGesture {
                    sitUpsCounter += 1
                    viewModel.checkTime()
                    WidgetCenter.shared.reloadAllTimelines()
                }
            }.padding(.bottom, 10)
            
            HStack{
                HStack(spacing: 5){
                    Image("greenCalender")
                    Text("0")
                        .foregroundColor(Color(UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 1)).opacity(0.5))
                        .font(.system(size: 24))
                }.padding(.leading, 20)
                
                Spacer()
                
                HStack(spacing: 3){
                    Image("greenChampion")
                    Text("12")
                        .foregroundColor(Color(UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 1)).opacity(0.5))
                        .font(.system(size: 24))
                }.padding(.trailing, 10)
            }
            .padding(.bottom, 16.0)
        }
        
    }
    
    var brushTeethWidget: some View{
        VStack(spacing: 10) {
            Text("Brush teeth")
                .font(.system(size: 27, weight: .medium))
                .foregroundColor(Color.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
            
            HStack(spacing: 27){
                Button(action: {
                    
                }) { Image("whiteMinus")
                        .onTapGesture {
                            if viewModel.isInSameDay(lastAddedDate: viewModel.savedTeethBrushing.last?.date ?? Date()){
                                let temp = (viewModel.savedTeethBrushing.last?.counter ?? 1) - 1
                                 if viewModel.savedTeethBrushing.count > 0 {
                                     viewModel.savedTeethBrushing.removeLast()
                                     WidgetCenter.shared.reloadAllTimelines()
                                 }
                                 viewModel.savedTeethBrushing.append(CounterModels(counter: temp, date: Date()))
                                WidgetCenter.shared.reloadAllTimelines()
                            }
                        }
                }
                Text(String(viewModel.savedTeethBrushing.last?.counter ?? 0))
                    .foregroundColor(Color.white)
                    .font(.system(size: 36, weight: .heavy))
                Image("whitePlus").onTapGesture {
                    if viewModel.isInSameDay(lastAddedDate: viewModel.savedTeethBrushing.last?.date ?? Date()){
                       let temp = (viewModel.savedTeethBrushing.last?.counter ?? 0) + 1
                        if viewModel.savedTeethBrushing.count > 0 {
                            viewModel.savedTeethBrushing.removeLast()
                        }
                        viewModel.savedTeethBrushing.append(CounterModels(counter: temp, date: Date()))
                    }
                   
                    else {
                        viewModel.savedTeethBrushing.append(CounterModels(counter: (viewModel.savedTeethBrushing.last?.counter ?? 0) + 1 , date: Date()))
                    }
                }
            }.padding(.bottom, 10)
            
            HStack{
                HStack(spacing: 5){
                    Image("calender")
                    Text("0")
                        .foregroundColor(Color.white.opacity(0.5))
                        .font(.system(size: 24))
                }.padding(.leading, 20)
                
                Spacer()
                
                HStack(spacing: 3){
                    Image("champion")
                    Text("12")
                        .foregroundColor(Color.white.opacity(0.5))
                        .font(.system(size: 24))
                }.padding(.trailing, 10)
            }
            .padding(.bottom, 16.0)
        }
        
    }
    
    func getTodaysDate() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        return dateFormatter.string(from: date)
    }
    
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
