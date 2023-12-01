//
//  ContentView.swift
//  Food Menu_V02
//
//  Created by Tom Xia on 11/28/23.
//

import SwiftUI
import ARKit
import RealityKit
import Combine


struct ContentView: View {
    
    @State private var showDimSumGrid = false
    
    var body: some View {
        NavigationView {
            ZStack() {
                Color(red:248/255, green:242/255, blue:233/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Button("Starter") {
                        //Action for Starter button
                        print("Starter tapped")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    
                    NavigationLink(destination: DimSumGridView(), isActive: $showDimSumGrid) {
                                           Button("Dim Sum") {
                                               showDimSumGrid = true
                                           }
                                           .buttonStyle(PrimaryButtonStyle())
                                       }
                    
                    Button("Not Dim Sum") {
                        print("Not Dim Sum tapped")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    
                }
                .padding(.bottom, 120)
                
                VStack(alignment: .trailing) {
                    Spacer()
                    
                    Image("steamTray")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
    //                    .padding(.bottom, 20)
                }
        
            }
            }
    }

    }


struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 200)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(Color(red:248/255, green:242/255, blue:233/255))
            .padding()
            .background(Color(red: 180/255, green:32/255, blue: 37/255))
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            }
    }


#Preview {
    ContentView()
}
