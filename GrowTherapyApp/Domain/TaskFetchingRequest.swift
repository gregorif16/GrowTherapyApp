//
//  TaskFetchingRequest.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import Foundation

protocol TaskFetching {
    func fetchTasks(completion: @escaping (Result<[Task], Error>) -> Void)
}


//TO DO: This is where the fetching of the tasks with the real data is supposed to happen

class TaskFetcher: TaskFetching {
    func fetchTasks(completion: @escaping (Result<[Task], any Error>) -> Void) {
        return
    }

}


class MockTaskFetcher: TaskFetching {
    func fetchTasks(completion: @escaping (Result<[Task], Error>) -> Void) {
        // Simulate a delay of 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Return the mockTasks array after the delay
            completion(.success(mockTasks))
        }
    }
}
