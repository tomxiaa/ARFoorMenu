//
//  EntityHelperMethods.swift
//  Food Menu_V02
//
//  Created by Tom Xia on 11/29/23.
//

import SwiftUI
import RealityKit


// MARK: - Create entity with USDZ model.

func makeModelEntity(name: String, usdzModelName: String) -> ModelEntity {
    let model = try! ModelEntity.loadModel(named: usdzModelName)
    model.name = name
    
    return model
}

extension ModelEntity {
    func animate(_ animate: Bool) {
        if animate {
            if let animation = self.availableAnimations.first {
                self.playAnimation(animation.repeat())
            }
        } else {
            self.stopAllAnimations()
        }
    }
}

