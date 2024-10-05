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
    @State private var messageFeedback = "You Win 🥳"
    @State private var score = [ "win": 0, "lose": 0]
    @State private var colorMsg: Color = .green
    @State private var numberGame = 0
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                VStack(spacing: 35){
                    
                    Text("\(messageFeedback)")
                        .scaleEffect(animate ? 1 : 0)
                        .font(.system(size: 50))
                        .foregroundStyle(colorMsg)
                        .fontWeight(.bold)
                    
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
                            .disabled(animate)
                        }
                    }
                    
                    Spacer()
                        .frame(height: 190)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.cyan)
                
                .alert("Best of 10", isPresented: $showAlert) {
                    Button("New Game"){
                        numberGame  = 0
                    }
                } message: {
                    Text("You win \(score["win"]!) \n You lose \(score["lose"]!)")
                }
                


            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(
                        optionSelected == ""
                            ? "Select an option"
                            : "Your selected \(optionSelected)"
                    )
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                }
            }
        }
    }
    
    func onClickOption(_ option: String) {
        
        optionSelected = option
        robotSelected = options.randomElement() ?? ""
        
        validateGame()
        
        withAnimation {
            animate = true
        }
        
        numberGame += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            robotSelected = "🤖"
            optionSelected = ""
            withAnimation {
                animate = false
            }
        }
        
        if numberGame == 10 {
            showAlert = true
            return
        }
    }
    
    func validateGame() {
        if optionSelected == "✊" && robotSelected == "🖐️" {
            loseMsg()
        }
        
        if optionSelected == "✊" && robotSelected == "✌️" {
            winMsg()
        }
        
        if optionSelected == "✊" && robotSelected == "✊" {
            repeatMsg()
        }
        
        if optionSelected == "🖐️" && robotSelected == "🖐️" {
            repeatMsg()
        }
        
        if optionSelected == "🖐️" && robotSelected == "✌️" {
            loseMsg()
        }
        
        if optionSelected == "🖐️" && robotSelected == "✊" {
            winMsg()
        }
        
        if optionSelected == "✌️" && robotSelected == "🖐️" {
            winMsg()
        }
        
        if optionSelected == "✌️" && robotSelected == "✌️" {
            repeatMsg()
        }
        
        if optionSelected == "✌️" && robotSelected == "✊" {
            loseMsg()
        }
    }
    
    func winMsg() {
        score["win"]! += 1
        colorMsg = .green
        messageFeedback = "You Win 🥳"
    }
    
    func loseMsg() {
        score["lose"]! += 1
        colorMsg = .red
        messageFeedback = "You lost 🤧"
    }
    
    func repeatMsg() {
        colorMsg = .black
        messageFeedback = "Repeat 🔄"
    }
    
}

#Preview {
    ContentView()
}
