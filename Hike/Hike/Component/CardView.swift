//
//  CardView.swift
//  Hike
//
//  Created by Do Huu Phuc on 11/04/2024.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet = false
    // MARK: - FUNCTIONS
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        
        // MARK: - CARD
        
        ZStack {
            CustomBackgroundView()
            
            VStack {
                
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight,
                                                        .customGrayMedium],
                                               startPoint: .top,
                                               endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                    }
                    .sheet(isPresented: $isShowingSheet, content: {
                        SettingView()
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.medium, .large])
                    })
                    
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(Color.customGrayMedium)
                    
                }
                .padding(20)//: HEADER
                
                // MARK: - MAIN CONTENT
                ZStack {

                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 1.0), value: imageNumber)
                }
                
                // MARK: - FOOTER
                
                Button {
                    // Action
                    print("Explore Button did tap")
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient.customGreen1)
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
                
            } //: VSTACK
        } // :CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
