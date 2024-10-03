//
//  ContentView.swift
//  Project-3-SwiftUI-rock-paper-scissors
//
//  Created by Kevin Cuadros on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    
    private var options: [String] = [ "✊", "🖐️", "✌️"]
    @State private var optionSelected = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 35){
                Text("🤖")
                    .font(.system(size: 80))
                
                Text("Rock, Paper, Scissors?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                HStack(spacing: 30){
                    ForEach(options, id: \.self) { option in
                        Button(option){
                            optionSelected = option
                        }
                        .font(.system(size: 80))
                    }
                }
                
                Spacer()
                    .frame(height: 70)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.indigo)
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Your selected \(optionSelected)")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.title2)
                }
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
