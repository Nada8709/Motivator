//
//  IncreaseCountIntent.swift
//  Motivator
//
//  Created by NadaAshraf on 11/10/2023.
//

import AppIntents
import SwiftUI

struct IncreasePushUpsCountIntent: AppIntent{
    static var title: LocalizedStringResource = "Increase Count"
    
    func perform() async throws -> some IntentResult {
        if let store = UserDefaults(suiteName: "group.Nada.Ashraf.Motivator"){
            let count = store.integer(forKey: "PushUpsCounter")
            store.setValue(count + 1, forKey: "PushUpsCounter")
            return .result()
        }
        return .result()
    }
}

struct IncreaseSitupsCountIntent: AppIntent{
    static var title: LocalizedStringResource = "Increase Count"
    
    func perform() async throws -> some IntentResult {
        if let store = UserDefaults(suiteName: "group.Nada.Ashraf.Motivator"){
            let count = store.integer(forKey: "SitUpsCounter")
            store.setValue(count + 1, forKey: "SitUpsCounter")
            return .result()
        }
        return .result()
    }
}
