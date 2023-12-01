//
//  ViewModel.swift
//  Food Menu_V02
//
//  Created by Tom Xia on 11/29/23.
//

import Foundation
import Combine

@MainActor
class ViewModel: ObservableObject {
    // App state variables.
    @Published var showDebug = false
    
    // For handling UI signals.
    enum UISignal {
        case reset
        case drop
        case place
        case randomize
    }
    let uiSignal = PassthroughSubject<UISignal, Never>()
    

    // Initialization method.
    init() {
        
    }
}
