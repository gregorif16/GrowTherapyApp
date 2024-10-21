//
//  TaskViewModel.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var loadingState: LoadingState = .loading 
    
    private let taskFetcher: TaskFetching

    init(taskFetcher: TaskFetching) {
        self.taskFetcher = taskFetcher
        loadTasks()
    }

    func loadTasks() {
        loadingState = .loading
        taskFetcher.fetchTasks { [weak self] result in
            switch result {
            case .success(let tasks):
                DispatchQueue.main.async {
                    self?.tasks = tasks
                    self?.loadingState = .loaded
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.loadingState = .error(error.localizedDescription)
                }
            }
        }
    }

}
