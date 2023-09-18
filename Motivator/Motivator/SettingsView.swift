//
//  SettingsView.swift
//  Motivator
//
//  Created by NadaAshraf on 18/09/2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview
    var body: some View {
        VStack{
            List{
                Section(header: Text("")){
                    HStack{
                        Text("About this app")
                        Spacer()
                        Image("arrow").renderingMode(.original)
                    }
                    HStack{
                        Text("Unlock pro features")
                        Spacer()
                        Image("arrow").renderingMode(.original)
                    }
                }
                Section(header: Text(""),footer: Text("PiCal is our calendar app for ADHD, and it’s pretty cool!")){
                    HStack{
                        Text("Rate us on the App Store")
                        Spacer()
                        Image("arrow").renderingMode(.original)
                    }.onTapGesture {
                        requestReview()
                    }
                    
                    HStack{
                        Text("Email us")
                        Spacer()
                        Image("arrow").renderingMode(.original)
                    }.onTapGesture {
                        openMail()
                    }
                    
                    HStack{
                        Text("WhatsApp")
                        Spacer()
                        Image("arrow").renderingMode(.original)
                    }.onTapGesture(perform: openWhatsapp)
                   
                    HStack{
                        Link("Learn about PiCal", destination: URL(string: "https://www.pical.app/")!)
                            .foregroundStyle(.black)
                        Spacer()
                        Image("arrow").renderingMode(.original)
                    }
                    
                }
            }
        }
    }
    
    func openWhatsapp(){
        let urlWhats = "https://wa.me/message/Y6ANP7HNHNHQF1"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL){
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(whatsappURL)
                    }
                }
                else {
                    print("Install Whatsapp")
                }
            }
        }
    }
    
    func openMail(){
        let email = "info@pical.app"
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
}

#Preview {
    SettingsView()
}
