//
//  ContentView.swift
//  Dicee - SwiftUI
//
//  Created by RANGA REDDY NUKALA on 23/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var leftDiceValue: Int = 1
    @State var righDiceValue: Int = 4

    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("diceeLogo")
                    .aspectRatio(contentMode: .fit)
                Spacer()
                HStack {
                    DiceView(n: leftDiceValue)
                    DiceView(n: righDiceValue)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    
                    self.leftDiceValue = Int.random(in: 1...6)
                    self.righDiceValue = Int.random(in: 1...6)
                    
                    
                    
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                        .padding(.horizontal)
                }.background(Color(.red))
                    .padding(.all)
                
            }
        }
    }
}

struct DiceView: View {
    
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(contentMode: .fit)
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

