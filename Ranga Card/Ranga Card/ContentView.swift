//
//  ContentView.swift
//  Ranga Card
//
//  Created by RANGA REDDY NUKALA on 21/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("Info Color")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(.white), lineWidth: 6.0)
                        .overlay(Circle().stroke(Color("Info Color"), lineWidth: 2.0)))
                    
                Text("Ranga Reddy")
                    .font(Font.custom("Bangers-Regular", size: 50))
                    .foregroundColor(.white)
                    .bold()
                    
                Text("iOS Developer")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                Divider()
                
                InfoView(text: "+91 123 456 789", imageName: "phone.fill")
                InfoView(text: "itsfake@alltime.com", imageName: "envelope.fill")
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


