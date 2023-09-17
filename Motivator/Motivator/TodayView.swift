//
//  TodayView.swift
//  Motivator
//
//  Created by NadaAshraf on 13/09/2023.
//

import SwiftUI

struct TodayView: View {
    
    
    var body: some View {
        VStack{
            VStack{
                Text(getTodaysDate())
                    .font(.system(size: 40, weight: .bold, design: .none))
                    .foregroundColor(Color("Grey3"))
                    .padding(.bottom, 24.0)
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
