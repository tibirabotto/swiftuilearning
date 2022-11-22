//
//  MaskBootcamp.swift
//  SwiftUILearning
//
//  Created by Tibirica Neto on 2022-11-22.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            starsViews
                .overlay(overlayView.mask(starsViews))
        }
    }
    
    private var starsViews: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            rating = index
                        }
                        
                    }
            }
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
                    
            }
        }
        .allowsHitTesting(false)
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
