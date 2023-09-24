//
//  EditView.swift
//  Motivator
//
//  Created by NadaAshraf on 22/09/2023.
//

import SwiftUI

struct EditView: View {
    @State var text = "Keep your back straight!"
    var body: some View {
        VStack{
            NavigationView{
                ZStack{
                    Color("Grey6").ignoresSafeArea()
                    VStack(alignment: .leading){
                        HStack(spacing: 16){
                            widgetView
                                .background(Color.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)), lineWidth: 4)
                                )
                            widgetView
                                .background(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)))
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)), lineWidth: 4)
                                )
                        }
                        .padding(.bottom, 28.0)
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing){
                                Button(action: {}) { Text("Save") }
                            }
                            ToolbarItem(placement: .navigationBarLeading){
                                Button(action: {}) { Text("Cancel") }
                            }
                        }
                        
                        notesView
                        nameView.padding(.bottom, 22.0)
                        progressMetricView.padding(.bottom, 22.0)
                        goalMetricView.padding(.bottom, 22.0)
                        
                    }.padding(.horizontal, 16.0)
                }
            }
        }
    }
   
    var notesView: some View{
        VStack(alignment: .leading){
            Text("Notes")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color("Black-White"))
            
            TextField("Keep your back straight!", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 60)
        }
    }
    
    var nameView: some View{
        VStack(alignment: .leading){
            Text("Name")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color("Black-White"))
            HStack{
                Text("Pushups")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.3)))
                    .padding(.vertical, 11)
                    .padding(.leading, 16)
                    
                Spacer()
                Image("arrow")
                    .padding(.trailing, 16)
            }.background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1)), lineWidth: 1)
            )
        }
    }
    
    var progressMetricView: some View{
        VStack(alignment: .leading){
            HStack(spacing: 7){
                Image("blackCalender")
                Text("Progress metric")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color("Black-White"))
            }
           
            HStack{
                Text("Past 7 day average")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.3)))
                    .padding(.vertical, 11)
                    .padding(.leading, 16)
                    
                Spacer()
                Image("arrow")
                    .padding(.trailing, 16)
            }.background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1)), lineWidth: 1)
            )
        }
    }
    
    var goalMetricView: some View{
        VStack(alignment: .leading){
            HStack(spacing: 7){
                Image("blackChampion")
                Text("Goal metric")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color("Black-White"))
            }
           
            HStack{
                Text("Personal best this month")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.3)))
                    .padding(.vertical, 11)
                    .padding(.leading, 16)
                    
                Spacer()
                Image("arrow")
                    .padding(.trailing, 16)
            }.background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1)), lineWidth: 1)
            )
        }
    }
    
    var widgetView: some View{
        VStack(spacing: 10) {
            Text("Pushups")
                .font(.system(size: 27, weight: .medium))
                .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)))
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
            
            HStack(spacing: 27){
                Button(action: {}) { Image("minus") }
                Text("0")
                    .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)).opacity(0.5))
                    .font(.system(size: 36, weight: .heavy))
                Button(action: {}) { Image("plus") }
            }.padding(.bottom, 10)
            
            HStack{
                HStack(spacing: 5){
                    Image("calender")
                    Text("9")
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
}

#Preview {
    EditView()
}
