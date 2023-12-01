//
//  SwiftUIView.swift
//  Food Menu_V02
//
//  Created by Tom Xia on 11/28/23.
//


import SwiftUI

struct DimSumGridView: View {
    
    let dimSumImages = ["SoupDumpling","ShrimpDumpling","ShShumai","DumplingsChili","PanPorkBun","ChivePancakes","PorkPot","VegDumpling","ScallionPancake"]
    @State private var isGridView = true // state to toggle between grid view and single view
    @State private var selectedImageIndex = 0 // state to track the current image index
    @State private var showARView = false
    
    var body: some View {
        ZStack {
            Color(red:248/255, green:242/255, blue:233/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                
                HStack {
                    Spacer()
                    Button(action: {
                        isGridView = false
                    }) {
                        Image(systemName: "rectangle")
                            .renderingMode(isGridView ? .template : .original)
                            .foregroundColor(.black)
                    }
                    Button(action: {
                        isGridView = true
                    }) {
                        Image(systemName: "rectangle.split.2x2")
                            .renderingMode(isGridView ? .template : .original)
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                
                //toggle button
                
                if isGridView {
                    GridView(dimSumImages: dimSumImages, selectedImageIndex: $selectedImageIndex, isGridView: $isGridView)
                } else {
                    EnlargedImageView(dimSumImages: dimSumImages, selectedImageIndex: $selectedImageIndex, showARView: $showARView)
                }
                
                if showARView {
                    ARSceneView()
                }
            }
        }
    }
}

struct GridView: View {
    let dimSumImages: [String]
    @Binding var selectedImageIndex: Int
    @Binding var isGridView: Bool
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(0..<dimSumImages.count, id: \.self) { index in
                                Image(dimSumImages[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100, height:100)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        selectedImageIndex = index // update the selected index
                                        isGridView = false // switch to single image view
                                    }
                            }
                        }
        .padding()
    }
}

struct EnlargedImageView: View {
    let dimSumImages: [String]
    @Binding var selectedImageIndex: Int
    @Binding var showARView: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<dimSumImages.count, id:\.self) { index in
                    Image(dimSumImages[index])
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 300)
            
            Spacer()
            
            Button("AR") {
                showARView = true
            }
            .buttonStyle(PrimaryButtonStyle())
        }
    }
}

#Preview {
    DimSumGridView()
}
