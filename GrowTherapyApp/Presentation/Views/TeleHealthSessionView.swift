//
//  TeleHealthSessionView.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import Foundation
import SwiftUI

struct TelehealthSessionView: View {
    @ObservedObject var viewModel: TaskViewModel
    @Binding var path: [Task]
    @State var showEmotionScreen = false

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                ZStack {
                    VStack { }
                        .modifier(BackgroundViewModifier())
                    Color.black.opacity(0.40)
                    
                    Text("You are in a session with your provider.")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 26))
                        .bold()
                }
              
            }
            
            Button {
                showEmotionScreen.toggle() // Show emotion rating screen
            } label: {
                VStack(spacing: -5) {
                    Rectangle()
                        .frame(width: 400, height: 2)
                        .foregroundColor(.cyan)
                        .opacity(0.20)
                        
                    Circle()
                        .foregroundStyle(.red)
                        .frame(width: 60, height: 60)
                        .padding()
                    Text("End session")
                        .padding(.bottom)
                    
                }
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.bottom, -40)
            }
        }
        .sheet(isPresented: $showEmotionScreen, content: {
            EmotionRatingView(viewModel: viewModel, path: $path)
        })
    }
}

