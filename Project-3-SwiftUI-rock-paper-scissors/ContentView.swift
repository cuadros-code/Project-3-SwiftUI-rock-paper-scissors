//
//  ContentView.swift
//  Project-3-SwiftUI-rock-paper-scissors
//
//  Created by Kevin Cuadros on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var options: [String] = [ "✊", "🖐️", "✌️"]
    @State private var robotSelected = "🤖"
    @State private var optionSelected = ""
    @State private var animate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 35){
                    Text(robotSelected)
                        .font(.system(size: 80))
                    
                    Text("Rock, Paper, Scissors?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    HStack(spacing: 30){
                        ForEach(options, id: \.self) { option in
                            Button(option){
                                onClickOption(option)
                            }
                            .font(.system(size: 80))
                        }
                    }
                    
                    Spacer()
                        .frame(height: 70)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.indigo)

                Rectangle()
                    .fill(.green)
                    .zIndex(99)
                    .frame(width: 300, height: 400)
                    .clipShape(.buttonBorder)
                    .offset(x: 0, y: animate ? -20 : 700)
                    .shadow(radius: 12)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Your selected \(optionSelected)")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                }
            }
        }
    }
    
    func onClickOption(_ option: String) {
        optionSelected = option
        robotSelected = options.randomElement() ?? ""
        
        withAnimation {
            animate = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            robotSelected = "🤖"
            optionSelected = ""
            withAnimation {
                animate = false
            }
        }
    }
    
    func validateGame() {
        if optionSelected == "✊" && robotSelected == "🖐️" {
            
        }
        
        if optionSelected == "✊" && robotSelected == "✌️" {
            
        }
    }
    
    
}

#Preview {
    ContentView()
}
