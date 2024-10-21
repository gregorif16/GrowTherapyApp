//
//  EmotionTrackingModel.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import Foundation

enum Emotion: String, Codable, CaseIterable, Identifiable {
    case happiness = "Happiness"
    case sadness = "Sadness"
    case anger = "Anger"
    case fear = "Fear"
    case surprise = "Surprise"
    
    var id: String { self.rawValue }
}
