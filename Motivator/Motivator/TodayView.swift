//
//  TodayView.swift
//  Motivator
//
//  Created by NadaAshraf on 13/09/2023.
//

import SwiftUI

struct TodayView: View {
   
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    var viewModel = WidgetViewModel()
//    @State var pushupsNumber: String = viewModel.getPushUpsCounter()
//    @State var situpsNumber: String = viewModel.getSitsUpsCounter()
    
    private var currentWidgets = [
        WidgetModel(title: "Pushups", borderColor: UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1), championImage: "champion", calenderImage: "calender", number: "0", calenderNumber: "9", championNumber: "12", backGroundColor: Color.white),
    
        WidgetModel(title: "Sit-ups", borderColor: UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 1), championImage: "greenChampion", calenderImage: "greenCalender", number: "0", calenderNumber: "12", championNumber: "20", backGroundColor: Color.white),
    
        WidgetModel(title: "Brush teeth", borderColor: UIColor.white, championImage: "champion", calenderImage: "calender", number: "0", calenderNumber: "9", championNumber: "12", backGroundColor: Color.orange),
      
        WidgetModel(title: "", borderColor: UIColor.white, championImage: "champion", calenderImage: "calender", number: "25", calenderNumber: "9", championNumber: "12", backGroundColor: Color("Grey6")),
        
    ]
    
    var body: some View {
        VStack{
            Text(getTodaysDate())
                .font(.system(size: 40, weight: .bold, design: .none))
                .foregroundColor(Color("Grey3"))
                .padding(.bottom, 24.0)
              
            HStack{
                pushUpsWidget
               sitUpsWidget
            }
        }
        
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
                       
                    }) { Image("minus") }
                    Text(viewModel.getPushUpsCounter())
                        .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)).opacity(0.5))
                        .font(.system(size: 36, weight: .heavy))
                    Image("plus").onTapGesture {
                        viewModel.increasePushUpsCounter()
                        //pushupsNumber = viewModel.getPushUpsCounter()
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
                    .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 15)
                
                HStack(spacing: 27){
                    Button(action: {
                       
                    }) { Image("minus") }
                    Text(viewModel.getSitsUpsCounter())
                        .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)).opacity(0.5))
                        .font(.system(size: 36, weight: .heavy))
                    Image("plus").onTapGesture {
                        viewModel.increaseSitsUpsCounter()
                        //situpsNumber = viewModel.getSitsUpsCounter()
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
