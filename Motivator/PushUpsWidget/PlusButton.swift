//
//  PlusButton.swift
//  Motivator
//
//  Created by NadaAshraf on 20/09/2023.
//

import Foundation
import AppIntents
import SwiftUI

public struct PlusButton: AppIntent{
    static var title: LocalizedStringResource = "plus button is pressed"
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
