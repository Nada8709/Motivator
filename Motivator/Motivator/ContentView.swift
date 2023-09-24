//
//  ContentView.swift
//  Motivator
//
//  Created by Nada Ashraf on 12/09/2023.
//

import SwiftUI

struct ContentView: View {
    init() {
    UITabBar.appearance().backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 0.94)
    }
    var body: some View {
        TabView{
            SettingsView()
                .tabItem {
                    Image("settings").renderingMode(.template)
                     Text("Settings")

                }
            TodayView()
                .tabItem {
                    Image("today").renderingMode(.template)
                     Text("Today")
                }

            ProgressTabView()
                .tabItem {
                    Image("graph").renderingMode(.template)
                     Text("Progress")
                }
        }
    }
    
    var x : some View{
        VStack{
            Text("x")
            Text("x")
            Text("x")
            Text("x")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
