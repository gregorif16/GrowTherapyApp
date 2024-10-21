//
//  MockData.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import Foundation

let currentDate = Date()

let mockTasks: [Task] = [
    // 2 completed tasks (the day before the current date)
    Task(breathCount: 5,
         dueDate: Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!,
         isCompleted: true,
         completionDate: Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!,
         emotionRatings: [
            .happiness: 8,
            .sadness: 2,
            .anger: 1,
            .fear: 3,
            .surprise: 6
         ],
         scenario: .completeExerciseFirst // Scenario: Complete exercise first
    ),
    
    Task(breathCount: 8,
         dueDate: Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!,
         isCompleted: true,
         completionDate: Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!,
         emotionRatings: [
            .happiness: 7,
            .sadness: 4,
            .anger: 2,
            .fear: 3,
            .surprise: 5
         ],
         scenario: .completeExerciseFirst // Scenario: Complete exercise first
    ),

    // 3 available tasks (current date)
    Task(breathCount: 6,
         dueDate: Calendar.current.startOfDay(for: currentDate),
         isCompleted: false,
         completionDate: nil,
         emotionRatings: [:],
         scenario: .providerAvailableMidExercise // Scenario: Provider becomes available mid-exercise
    ),
    
    Task(breathCount: 4,
         dueDate: Calendar.current.startOfDay(for: currentDate),
         isCompleted: false,
         completionDate: nil,
         emotionRatings: [:],
         scenario: .providerAvailableFromStart // Scenario: Provider available from the start
    ),
    
    Task(breathCount: 3,
         dueDate: Calendar.current.startOfDay(for: currentDate),
         isCompleted: false,
         completionDate: nil,
         emotionRatings: [:],
         scenario: .completeExerciseFirst
    ),

    // 1 future task (one day after the current date)
    Task(breathCount: 7,
         dueDate: Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!,
         isCompleted: false,
         completionDate: nil,
         emotionRatings: [:],
         scenario: .providerAvailableMidExercise
    )
]
