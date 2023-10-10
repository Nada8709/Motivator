//
//  WidgetView.swift
//  Motivator
//
//  Created by NadaAshraf on 22/09/2023.
//

import SwiftUI

struct WidgetView: View {
    var viewModel = WidgetViewModel()

    @State var title: String = "title"
    @State var borderColor: UIColor = UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)
    @State var championImage: String = "champion"
    @State var calenderImage: String = "calender"
    @State var number: String = "0"
    @State var calenderNumber: String = "0"
    @State var championNumber: String = "0"
    
    var body: some View {
        
        if title.isEmpty {
            Image("plusCircle")
        }
        else{
            VStack(spacing: 10) {
                Text(title)
                    .font(.system(size: 27, weight: .medium))
                    .foregroundColor(Color(borderColor))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 15)
                
                HStack(spacing: 27){
                    Button(action: {
                       
                    }) { Image("minus") }
                    Text(number)
                        .foregroundColor(Color(borderColor).opacity(0.5))
                        .font(.system(size: 36, weight: .heavy))
                    Image("plus").onTapGesture {
                        //viewModel.increasePushUpsCounter()
                    }
                }.padding(.bottom, 10)
                
                HStack{
                    HStack(spacing: 5){
                        Image(calenderImage)
                        Text(calenderNumber)
                            .foregroundColor(Color(borderColor).opacity(0.5))
                            .font(.system(size: 24))
                    }.padding(.leading, 20)
                    
                    Spacer()
                    
                    HStack(spacing: 3){
                        Image(championImage)
                        Text(championNumber)
                            .foregroundColor(Color(borderColor).opacity(0.5))
                            .font(.system(size: 24))
                    }.padding(.trailing, 10)
                }
                .padding(.bottom, 16.0)
            }
        }
    }
}

#Preview {
    WidgetView()
}
