//
//  DataModels.swift
//  Motivator
//
//  Created by NadaAshraf on 26/09/2023.
//

import SwiftUI
public struct WidgetModel : Hashable{
     var title: String
     var borderColor: UIColor
     var championImage: String
     var calenderImage: String
     var number: String
     var calenderNumber: String
     var championNumber: String
     var backGroundColor: Color
}

public struct PushUps : Hashable{
     var number: Int16
     var goalNumber: Int16
     var progressNumber: Int16

}

public struct SitUps{
     var number: Int16
     var goalNumber: Int16
     var progressNumber: Int16
}
