//
//  MultipleSheetsBootcamp.swift
//  SwiftUILearning
//
//  Created by Tibirica Neto on 2022-11-22.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel?

    
    var body: some View {
        VStack(spacing: 20.0) {
            Button("BUTTON 1") {
               selectedModel = RandomModel(title: "ONE")
            }

            Button("BUTTON 2") {
                selectedModel = RandomModel(title: "TWO")
            }
  
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
    }
}

struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

 
struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
