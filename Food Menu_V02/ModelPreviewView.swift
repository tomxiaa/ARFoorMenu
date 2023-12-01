//
//  ModelPreviewView.swift
//  Food Menu_V02
//
//  Created by Tom Xia on 11/29/23.
//

import SwiftUI
import RealityKit

struct ModelPreviewView: View {
    var body: some View {
        ModelPreviewContainer()
    }
}

struct ModelPreviewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)

        let arView = ARView(frame: .zero)
        view.addSubview(arView)

        // Load the 'shrimp' USDZ model
        if let modelEntity = try? ModelEntity.load(named: "Shrimp") {
            let anchorEntity = AnchorEntity()
            anchorEntity.addChild(modelEntity)
            arView.scene.addAnchor(anchorEntity)
        } else {
            print("Failed to load the modelEntity 'Shrimp'")
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct ModelPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ModelPreviewView()
    }
}

