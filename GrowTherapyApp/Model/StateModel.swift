//
//  StateModel.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import Foundation

enum LoadingState: Equatable {
    case loading
    case loaded
    case error(String)
}
