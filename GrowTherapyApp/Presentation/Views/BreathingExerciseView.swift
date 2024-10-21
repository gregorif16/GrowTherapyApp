//
//  BreathingExerciseView.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import Foundation
import SwiftUI


struct BreathingExerciseView: View {
    @ObservedObject var viewModel: TaskViewModel
    @Binding var path: [Task]
    @State private var circleSize: CGFloat = 70
    @State private var secondCircleSize: CGFloat = 35
    @State private var isGrowing = false
    @State private var isProviderAvailable = false // Track provider availability
    var task: Task
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Breath deeply \(task.breathCount) times!")
                .font(.system(size: 24))
                .bold()
            Spacer()
            
            ZStack {
                Circle()
                    .frame(width: circleSize, height: circleSize)
                    .foregroundColor(.cyan)
                    .shadow(color: .cyan, radius: 36)
                
                Circle()
                    .frame(width: secondCircleSize, height: secondCircleSize)
                    .foregroundColor(.blue)
                    .shadow(color: .blue, radius: 62)
                    .opacity(0.1)
                    .blur(radius: 2)
            }
            .frame(width: 300, height: 300)
            .onAppear {
     
                withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    isGrowing.toggle()
                    circleSize = isGrowing ? 300 : 70
                    secondCircleSize = isGrowing ? 150 : 35
                }
                
                // Simulate provider availability mid-exercise for providerAvailableMidExercise scenario
                if task.scenario == .providerAvailableMidExercise {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) { // Simulate provider joining after 10 seconds
                        isProviderAvailable = true
                    }
                }
            }
            
            Spacer()
            
            // Show message if provider becomes available mid-exercise
            if isProviderAvailable && task.scenario == .providerAvailableMidExercise {
                withAnimation {
                    Text("Your provider has joined")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.bottom)
                }
            }
            
            // Show "Join" button based on scenario
            if (isProviderAvailable && task.scenario == .providerAvailableMidExercise) ||
                task.scenario == .completeExerciseFirst {
                NavigationLink {
                    TelehealthSessionView(viewModel: viewModel, path: $path)
                } label: {
                    Text("Join")
                        .font(.title2)
                        .frame(width: 350, height: 50)
                        .background(.cyan)
                        .cornerRadius(12)
                        .padding(.bottom)
                }
            }
        }
        .navigationBarTitle("Breathing Exercise", displayMode: .inline)
        .modifier(BreathingBackgroundViewModifier())
    }
}
