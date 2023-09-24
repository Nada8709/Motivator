//
//  DetailsView.swift
//  Motivator
//
//  Created by NadaAshraf on 20/09/2023.
//

import SwiftUI

struct DetailsView: View {
    @State var text = "Keep your back straight!"
    var body: some View {
        VStack{
            NavigationView{
                ZStack{
                    Color("Grey6").ignoresSafeArea()
                    VStack{
                        widgetView
                            .background(Color.white)
                            .overlay(
                                Rectangle()
                                    .stroke(Color("Grey5"),lineWidth: 2)
                            )
                            .cornerRadius(25)
                            .padding(.horizontal, 100)
                            .padding(.bottom, 50)
                        Spacer()
                        middleView
                            .padding(.horizontal, 16)
                            .background(Color("Grey6"))
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing){
                                    Button(action: {}) {
                                        HStack {
                                            Image(systemName: "pencil")
                                            Text("Edit")
                                        }
                                    }
                                }
                                ToolbarItem(placement: .navigationBarLeading){
                                    Button(action: {}) {
                                        HStack {
                                            Image(systemName: "chevron.left")
                                            Text("Back")
                                        }
                                    }
                                }
                            }
                            .offset(y: -300)
                    }
                    
                }
            }
        }
    }
    
    var middleView: some View{
        VStack(alignment: .leading, spacing: 5){
            Text("Notes")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color("Black-White"))
            
            TextField("Keep your back straight!", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 60)
            
            Text("Video")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color("Black-White"))
                .padding(.bottom, 15)
           
            uploadVideo
                .background(.white)
                .cornerRadius(20)
                
        }
    }
    
    var uploadVideo: some View{
        HStack{
            Image("upload")
            
            Button("upload video", action: {})
                .font(.system(size: 19))
                .foregroundColor(Color("Black-White"))
                .cornerRadius(20)
            Spacer()
        }.padding(.vertical, 9)
            .padding(.leading, 24)
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
    DetailsView()
}
