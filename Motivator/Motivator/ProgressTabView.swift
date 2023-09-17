//
//  ProgressTabView.swift
//  Motivator
//
//  Created by NadaAshraf on 13/09/2023.
//

import SwiftUI

struct ProgressTabView: View {
    @State private var selectedPeriod = 0
    @State private var selectedTab = 1
    @State private var pushupsBorderColor = Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1))
    @State private var situpsBorderColor = Color(UIColor(red: 0.13, green: 0.59, blue: 0.33, alpha: 1))
    var body: some View {
        VStack{
            VStack{
                Text("Progress")
                    .font(.system(size: 40, weight: .bold, design: .none))
                    .foregroundColor(Color("Grey3"))
                    .padding(.bottom, 24.0)
                
                Picker("Period Picker", selection: $selectedPeriod) {
                    Text("D").tag(0)
                    Text("W").tag(1)
                    Text("M").tag(2)
                    Text("Y").tag(3)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 24.0)
                .padding(.bottom, 24.0)
                //chart
                
                HStack{
                    Button("Pushups", action: {
                        situpsBorderColor = Color("Grey5")
                        pushupsBorderColor = Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1))
                    })
                        .font(.system(size: 27, weight: .medium))
                        .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)))
                        .padding(.horizontal, 32)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(pushupsBorderColor,lineWidth: 2)
                        )
                    
                    Button("Sit-ups", action: {
                        pushupsBorderColor = Color("Grey5")
                        situpsBorderColor = Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1))
                    })
                        .font(.system(size: 27, weight: .medium))
                        .foregroundColor(Color(UIColor(red: 0.13, green: 0.59, blue: 0.33, alpha: 1)).opacity(0.6))
                        .padding(.horizontal, 32)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(situpsBorderColor.opacity(0.6),lineWidth: 2)
                        )
                }
            }.padding(.top, 14.0)
            Spacer()
        }
    }
}

struct ProgressTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTabView()
    }
}
