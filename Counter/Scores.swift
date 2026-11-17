//
//  Scores.swift
//  Counter
//
//  Created by SOFIA VERDUGO on 17/11/26.
//

import SwiftUI

struct Scores: View {
    @State private var counterA = 0
    @State private var counterB = 0
    @State private var winner = "_"
    
    var body: some View {
        Text("Scores")
            .font(.largeTitle)
            .bold()
        HStack(spacing: 0){
            // Team A
            VStack(spacing: 24) {
                Text("Team A")
                    .font(.title3)
                    .bold()
                
                // Number
                Text("\(counterA)")
                    .font(.system(size: 66, weight: .bold))
                    .foregroundStyle(counterA >= 10 ? Color.blue : Color.primary)
                    .contentTransition(.numericText())
                
                // Button row
                HStack(spacing: 16) {
                    // Button sub
                    Button {
                        withAnimation {
                        counterA -= 1
                        }
                    } label: {
                    Image(systemName: "minus").frame(width: 30, height: 24)
                    }
                    .buttonStyle(.bordered)
                    .disabled(counterA == 0)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    // Button add
                    Button {
                        withAnimation {
                            counterA += 1
                        }
                        if counterA == 10 && counterB != 10 {
                            winner = "A"
                        }
                    } label: {
                    Image(systemName: "plus").frame(width: 30, height: 24)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(counterA == 10)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
            }.tint(.blue).padding()
            
            
            // vs
            Text("vs")
                .font(.subheadline)
            
            // Team B
                VStack(spacing: 24) {
                    Text("Team B")
                        .font(.title3)
                        .bold()
                    
                    // Number
                    Text("\(counterB)")
                        .font(.system(size: 66, weight: .bold))
                        .foregroundStyle(counterB >= 10 ? Color.purple : Color.primary)
                        .contentTransition(.numericText())
                    
                    // Button row
                    HStack(spacing: 16) {
                        // Button sub
                        Button {
                            withAnimation {
                            counterB -= 1
                            }
                        } label: {
                        Image(systemName: "minus").frame(width: 30, height: 24)
                        }
                        .buttonStyle(.bordered)
                        .disabled(counterB == 0)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        // Button add
                        Button {
                            withAnimation {
                                counterB += 1
                            }
                            if counterB == 10 && counterA != 10 {
                                winner = "B"
                            }
                        } label: {
                        Image(systemName: "plus").frame(width: 30, height: 24)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(counterB == 10)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
            }
                .tint(.purple)
                .padding()
            }
        Button("Restart", role: .destructive) {
            withAnimation {
                counterA = 0
                counterB = 0
            }
        }
        
        if counterA > counterB && counterA != 10 {
            Text("Team A is winning!")
            .font(.headline)
        } else if counterB > counterA && counterB != 10 {
            Text("Team B is winning!")
            .font(.headline)
        } else if counterA == counterB && counterA != 10{
            Text("It's a tie!")
            .font(.headline)
        } else if counterA == 10 && counterB != 10 {
            Text("Team A won!")
            .font(.headline)
            
        } else if counterB == 10 && counterA != 10 {
            Text("Team B won!")
            .font(.headline)
        } else {
            Text("Team \(winner) won!")
            .font(.headline)
        }
    }
}



#Preview {
    Scores()
}
