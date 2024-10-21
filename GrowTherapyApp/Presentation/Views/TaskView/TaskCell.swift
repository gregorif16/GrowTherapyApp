//
//  TaskCell.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import SwiftUI

struct TaskCell: View {
    var task: Task
    
    var body: some View {
        HStack(spacing: 2) {
            if task.isLocked {
                Image(systemName: "brain.filled.head.profile")
                    .resizable()
                    .foregroundColor(.cyan)
                    .frame(width: 60, height: 60)
                    .padding(8)
            } else {
                Image(systemName: "brain.head.profile.fill")
                    .resizable()
                    .foregroundColor(.cyan)
                    .frame(width: 60, height: 60)
                    .padding(8)
            }
            
            VStack(alignment: .leading) {
                Text(task.dueDateFormatted)
                    .font(.custom("Manrope", size: 17))
                    .foregroundColor(.primary)
                Text("Breath Count: \(task.breathCount)")
                    .font(.custom("Manrope", size: 14))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: iconName)
                .resizable()
                .foregroundColor(iconColor)
                .frame(width: iconFrameWidth, height: 24)
                .opacity(0.8)
                .padding(4)
                .padding(.horizontal, 12)
        }
        .frame(width: 350, height: 80)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
        .cornerRadius(12)
    }

    // Computed property to determine the icon name
    var iconName: String {
        if task.isLocked {
            return "lock"
        } else if task.isCompleted {
            return "checkmark.seal.fill"
        } else {
            return "chevron.right"
        }
    }

    // Computed property to determine the icon color
    var iconColor: Color {
        if task.isCompleted {
            return .green
        } else if task.isLocked {
            return .gray
        } else {
            return .cyan
        }
    }
    
    var iconFrameWidth: CGFloat {
        return (iconName == "lock" || iconName == "chevron.right") ? 18 : 24
    }
}

extension Task {
    var dueDateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: dueDate)
    }
}
