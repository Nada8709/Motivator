//
//  TodayView.swift
//  Motivator
//
//  Created by NadaAshraf on 13/09/2023.
//

import SwiftUI

struct TodayView: View {
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var currentWidgets = [
        WidgetModel(title: "Pushups", borderColor: UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1), championImage: "champion", calenderImage: "calender", number: "10", calenderNumber: "9", championNumber: "12", backGroundColor: Color.white),
        WidgetModel(title: "Sit-ups", borderColor: UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 1), championImage: "greenChampion", calenderImage: "greenCalender", number: "0", calenderNumber: "12", championNumber: "20", backGroundColor: Color.white),
        WidgetModel(title: "Brush teeth", borderColor: UIColor.white, championImage: "champion", calenderImage: "calender", number: "25", calenderNumber: "9", championNumber: "12", backGroundColor: Color.orange),
        WidgetModel(title: "", borderColor: UIColor.white, championImage: "champion", calenderImage: "calender", number: "25", calenderNumber: "9", championNumber: "12", backGroundColor: Color("Grey6")),
        
    ]
    
    var body: some View {
        ScrollView {
            Text(getTodaysDate())
                .font(.system(size: 40, weight: .bold, design: .none))
                .foregroundColor(Color("Grey3"))
                .padding(.bottom, 24.0)
            
            LazyVGrid(columns: twoColumnGrid) {
                ForEach(Array(currentWidgets.enumerated()), id: \.element) { index, element in
                    WidgetView(title: element.title, borderColor: element.borderColor, championImage: element.championImage, calenderImage: element.calenderImage, number: element.number, calenderNumber: element.calenderNumber, championNumber: element.championNumber)
                        .background(element.backGroundColor)
                        .cornerRadius(25)
                        .padding(element.title.isEmpty ? 57 : 0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("Grey4"), lineWidth: 1)
                        )
                }
            }.padding(.horizontal, 16)
        }.background(Color("Grey6"))
    }
    
  
    var v : some View{
        VStack{
            VStack{
                HStack{
                    WidgetView(title: "Pushups", borderColor: UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1), championImage: "champion", calenderImage: "calender", number: "10", calenderNumber: "9", championNumber: "12")
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("Grey5"), lineWidth: 1)
                        )
                        .padding(.leading, 16)
                    
                    WidgetView(title: "Sit-ups", borderColor: UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 1), championImage: "greenChampion", calenderImage: "greenCalender", number: "0", calenderNumber: "12", championNumber: "20")
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("Grey5"), lineWidth: 1)
                        )
                        .padding(.trailing, 16)
                }
                HStack{
                    WidgetView(title: "Brush teeth", borderColor: UIColor.white, championImage: "champion", calenderImage: "calender", number: "25", calenderNumber: "9", championNumber: "12")
                        .background(Color.orange)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("Grey5"), lineWidth: 1)
                        )
                        .padding(.leading, 16)
                    
                    Image("plusCircle")
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("Grey5"), lineWidth: 1)
                        )
                        .padding(.trailing, 16)
                }
            }
            Spacer()
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
