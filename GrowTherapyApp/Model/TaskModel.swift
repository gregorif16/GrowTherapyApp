//
//  TaskModel.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import Foundation

//Testing Scenarios
enum TaskScenario: String, Codable {
    case providerAvailableFromStart
    case providerAvailableMidExercise
    case completeExerciseFirst
}

struct Task: Identifiable, Codable, Hashable {
    var id = UUID()
    var breathCount: Int
    var dueDate: Date
    var isCompleted: Bool = false
    var completionDate: Date?
    var emotionRatings: [Emotion: Int] = [:] 
    var scenario: TaskScenario
    
    var isEligible: Bool {
        return !isCompleted && Calendar.current.isDateInToday(dueDate)
    }
    
    var isLocked: Bool {
        return dueDate > Date()
    }
}
