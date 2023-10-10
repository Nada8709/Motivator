//
//  WidgetViewModel.swift
//  Motivator
//
//  Created by NadaAshraf on 25/09/2023.
//

import SwiftUI
final class WidgetViewModel: ObservableObject{
    
    static let shared = WidgetViewModel()
    
    @Published var savedPushUps : [CounterModels] = Array<CounterModels>(rawValue: UserDefaults.standard.string(forKey: "PushUpsCounter") ?? "[]") ?? [] {
        didSet {
            UserDefaults.standard.setValue(savedPushUps.rawValue, forKey: "PushUpsCounter")
        }
    }
    
    @Published var savedSitUps : [CounterModels] = Array<CounterModels>(rawValue: UserDefaults.standard.string(forKey: "SitUpsCounter") ?? "[]") ?? [] {
        didSet {
            UserDefaults.standard.setValue(savedSitUps.rawValue, forKey: "SitUpsCounter")
        }
    }
    
    @Published var savedTeethBrushing : [CounterModels] = Array<CounterModels>(rawValue: UserDefaults.standard.string(forKey: "BrushTeethCounter") ?? "[]") ?? [] {
        didSet {
            UserDefaults.standard.setValue(savedTeethBrushing.rawValue, forKey: "BrushTeethCounter")
        }
    }
    
    func isInSameDay(lastAddedDate: Date) -> Bool{
        if Calendar.current.isDate(lastAddedDate, inSameDayAs: Date()){
            return true
        }
        return false
    }
    
    func getLastAverage(type: WidgetTypes, number: Int) -> Int{
        switch type {
        case .PushUps:
            return savedPushUps.suffix(number).reduce(0) { $0 + $1.counter } / number
        case .SitUps:
            return savedSitUps.suffix(number).reduce(0) { $0 + $1.counter } / number
        case .BrushTeeth:
            return savedTeethBrushing.suffix(number).reduce(0) { $0 + $1.counter } / number
        }
    }
    
    func getAllTimeAverage(type: WidgetTypes) -> Int{
        switch type {
        case .PushUps:
            return savedPushUps.reduce(0) { $0 + $1.counter } / savedPushUps.count
        case .SitUps:
            return savedSitUps.reduce(0) { $0 + $1.counter } / savedSitUps.count
        case .BrushTeeth:
            return savedTeethBrushing.reduce(0) { $0 + $1.counter } / savedTeethBrushing.count
        }
    }
    
    func getPersonalBest(type: WidgetTypes, number: Int) -> Int{
        switch type {
        case .PushUps:
            return savedPushUps.suffix(number).map{$0.counter}.max() ?? 0
        case .SitUps:
            return savedSitUps.suffix(number).map{$0.counter}.max() ?? 0
        case .BrushTeeth:
            return savedTeethBrushing.suffix(number).map{$0.counter}.max() ?? 0
        }
    }
    
    func getAllTimePersonalBest(type: WidgetTypes) -> Int{
        switch type {
        case .PushUps:
            return savedPushUps.map{$0.counter}.max() ?? 0
        case .SitUps:
            return savedSitUps.map{$0.counter}.max() ?? 0
        case .BrushTeeth:
            return savedTeethBrushing.map{$0.counter}.max() ?? 0
        }
    }
    
}

struct CounterModels: Codable {
    var counter: Int
    var date: Date
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else {
            return nil
        }
        do {
            let result = try JSONDecoder().decode([Element].self, from: data)
            print("Init from result: \(result)")
            self = result
        } catch {
            print("Error: \(error)")
            return nil
        }
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        print("Returning \(result)")
        return result
    }
}

public enum WidgetTypes{
    case PushUps
    case SitUps
    case BrushTeeth
}
