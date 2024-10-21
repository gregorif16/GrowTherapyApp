//
//  TaskView.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import Foundation
import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel = TaskViewModel(taskFetcher: MockTaskFetcher())
    @State var path = [Task]() // Use Task directly in the navigation path
    
    var body: some View {
        if viewModel.loadingState == .loading {
            LoadingView() // Show a loading view while data is being fetched
        } else {
            NavigationStack(path: $path) {
                
                Rectangle() // Separator
                    .frame(width: 350, height: 2)
                    .foregroundColor(.cyan)
                    .padding()
                    .opacity(0.20)
                
                ScrollView(.vertical) {
                    ForEach(viewModel.tasks.sorted(by: { $0.dueDate > $1.dueDate })) { task in
                        if task.isCompleted || task.isLocked {
                            TaskCell(task: task)
                        } else {
                            Button(action: {
                                path.append(task) // Append Task to navigation path
                            }) {
                                TaskCell(task: task) // Display task details
                            }
                        }
                    }
                }
                .navigationTitle("My Tasks")
                .modifier(BackgroundViewModifier())
                
                // Navigation based on the Task
                .navigationDestination(for: Task.self) { task in
                    switch task.scenario {
                    case .providerAvailableFromStart:
                        TelehealthSessionView(viewModel: viewModel, path: $path)
                            .toolbar(.hidden, for: .tabBar)
                            .navigationBarBackButtonHidden(false)
                        
                    case .providerAvailableMidExercise, .completeExerciseFirst:
                        BreathingExerciseView(viewModel: viewModel, path: $path, task: task)
                            .toolbar(.hidden, for: .tabBar)
                            .navigationBarBackButtonHidden(false)
                    }
                }
            }
        }
    }
}


#Preview {
    LoadingView()
}
