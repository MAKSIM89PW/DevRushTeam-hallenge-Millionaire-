//
//  HelpRoomView.swift
//  wwbm
//
//  Created by dsm 5e on 01.03.2024.
//

import Foundation

import SwiftUI

struct Bar: Identifiable {
    let id = UUID()
    var name: String
    var value: Double
    var color: LinearGradient
    let index: Int

    static func createBars(index: Int) -> [Bar] {
        var tempBars = [Bar]()
        var color: LinearGradient?
        let answers = ["A","B","C","D"]

        for i in 0...3 {
            var rand: Double

            if i == index {
                rand = Double.random(in: 60...94)
            } else {
                rand = Double.random(in: 0...45)
            }

            color = LinearGradient(colors: [.indigo, .purple], startPoint: .bottom, endPoint: .top)

            let bar = Bar(name: answers[i], value: rand, color: color!, index: i)
            tempBars.append(bar)
        }
        return tempBars
    }
}

struct HelpRoomView: View {
    
    let index: Int
    
    @State var bars: [Bar] = []
    @State var animate: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Text("Помощь зала")
                    .font(.title).bold()
                    .foregroundStyle(.white)
                HStack(alignment: .bottom) {
                    ForEach(bars) { bar in
                        VStack {
                            Text("\(Int(bar.value))%")
                                .font(.caption)
                                .foregroundColor(.black)
                                .padding(3)
                                .animation(.easeInOut(duration: 2), value: animate)
                            ZStack {
                                Rectangle()
                                    .frame(width: 35, height: animate ? bar.value * 2 : 0, alignment: .bottom)
                                    .cornerRadius(6)
                                    .background(bar.color)
                                    .animation(.easeInOut(duration: 2), value: animate)
                            }
                            Text(bar.name)
                        }
                        
                    }
                }
                .frame(height:240, alignment: .bottom)
                .padding(20)
                .background(.regularMaterial)
                .cornerRadius(15)
            }
        }
        .onAppear {
            self.bars = Bar.createBars(index: index)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    HelpRoomView(index: 2)
}
