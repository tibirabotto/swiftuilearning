//
//  DragGestureBootcamp.swift
//  SwiftUILearning
//
//  Created by Tibirica Neto on 2022-11-20.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
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
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .scaleEffect(getScaleAmount())
                .gesture(
                    DragGesture()
                        .onChanged({ valeu in
                            withAnimation(.spring()) {
                                offset = valeu.translation
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        })
                )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAount = abs(offset.width)
        let percentage = currentAount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageASDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentageASDouble * maxAngle
    }
}

struct DragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}
