//
//  DragMoveSwipGesture.swift
//  UIElements
//
//  Created by Tony Chen on 26/2/2024.
//

import SwiftUI

struct DragMoveSwipGesture: View {
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRoationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            offset = value.translation
                        }
                        .onEnded{ value in
                            withAnimation(.spring) {
                                offset = .zero
                            }
                        }
                    
                )
        }
    }
    
    // MARK: Calculate value based on horizontal offset (offset.width)
    func getScaleAmount() -> CGFloat {
        // calculates half the height of the screen. Total screen height divided by 2 gets midpoint
        // card move to left gets negative number, move to right positive number
        let max = UIScreen.main.bounds.height / 2
        // calculates absolute value of the horizon offset
        let currentAmount = abs(offset.width)
        // calculates ratio of currentAmount of horizontal movement to the max threshold
        // this number means how much of the maximum allowed movement CurrentAmount acieved
        let percentage = currentAmount / max
        // Ensure the percentage value does not exceed 50%, then scaling it down by 50%. Then subtracts scale down drom 1.0. Use 1.0 is to ensure the object starts full visible and in full scale. e.g. 1 - 0.5 * 0.5 = 0.75 means the element scale at least 75%.
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRoationAmount() -> Double {
        // calculates half the height of the screen. Total screen height divided by 2 gets midpoint
        // card move to left gets negative number, move to right positive number
        let max = UIScreen.main.bounds.width / 2
        // calculates value of the horizon offset.
        let currentAmount = offset.width
        // This calculates the percentage of the maximum movement that has been achieved with the current drag.
        let percentage = currentAmount / max
        // Bacause currentAmount and max is CGfloat
        let percentageAsDouble = Double(percentage)
        // This sets the maximum rotation angle (in degrees) that the UI element should rotate in response to the drag. Ensure the element will not rotate more then 10 degrees, regardless of how much further the suer drags.
        let maxAngle: Double = 10
        // calculates the actual rotation angle based on the current drag offset. This means the rotation angle increases linearly with the drag distance, up to a maximum of 10 degrees when the drag offset reaches half the screen's width
        return percentageAsDouble * maxAngle
    }
}

struct DragMoveSwipGesture2: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY : CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring) {
                                // From the start of the drag gesture to the current event of the drag gesture
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded{ value in
                            withAnimation(.spring) {
                                // When grag element from bottom to up the translation height is negative
                                if currentDragOffsetY < -150 {
                                    // Set endingOffsetY to the negative number of startingOffsetY. This is to bring the element back to the start position if currentDragOffsetY is less then -150.
                                    endingOffsetY = -startingOffsetY
                                    // When drag element from up to bottom the translation height is positive.
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    // Set element to bottom
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        }
                )
            Text("\(currentDragOffsetY)")
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description for our app. This is the Drag and Swip Gesture")
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Create an Account")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 10)))
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}


#Preview {
    //DragMoveSwipGesture()
    DragMoveSwipGesture2()
}
