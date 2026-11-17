//
//  ContentView.swift
//  Counter
//
//  Created by SOFIA VERDUGO on 17/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    var body: some View {
        VStack(spacing: 24) {
            Text("Counter")
                .font(.largeTitle)
                .bold()
            
            // Number
            Text("\(counter)")
                .font(.system(size: 96, weight: .bold))
                .foregroundStyle(counter >= 10 ? Color.purple : Color.primary)
                .contentTransition(.numericText())
            
            // Button row
            HStack(spacing: 16) {
                // Button sub
                Button {
                    withAnimation {
                    counter -= 1
                    }
                } label: {
                Image(systemName: "minus").frame(width: 60, height: 44)
                }.buttonStyle(.bordered).disabled(counter == 0)
                
                // Button add
                Button {
                    withAnimation {
                        counter += 1
                    }
                } label: {
                Image(systemName: "plus").frame(width: 60, height: 44)
                }.buttonStyle(.borderedProminent).disabled(counter == 10)
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
                
                
                Button("Restart", role: .destructive) {
                    withAnimation {
                    counter = 0
                    }
                }
                if counter >= 10 {
                Text("You reached 10!")
                .font(.headline)
                }
                
    }
        .tint(.purple)
        .padding()
    }
}
#Preview {
    ContentView()
}
