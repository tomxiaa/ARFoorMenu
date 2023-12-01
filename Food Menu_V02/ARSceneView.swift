//
//  ARSceneView.swift
//  Food Menu_V02
//
//  Created by Tom Xia on 11/29/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ARSceneView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        // Configure the AR session for horizontal plane detection
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        arView.session.run(config)

        // Load the "Shrimp" USDZ model
        if let modelEntity = try? ModelEntity.load(named: "Shrimp") {
            let anchorEntity = AnchorEntity(plane: .horizontal)
            anchorEntity.addChild(modelEntity)
            arView.scene.addAnchor(anchorEntity)
        }

        return arView 
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}

