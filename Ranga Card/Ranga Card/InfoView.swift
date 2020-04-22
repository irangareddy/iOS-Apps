//
//  InfoView.swift
//  Ranga Card
//
//  Created by RANGA REDDY NUKALA on 22/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(Color("Rectangle Color"))
            .overlay(Text(text))
        
            
            .overlay(Image(systemName: imageName).position(x: 75, y: 25))
       
            
            
            
            
//            for fixed postion of sf symbols
            
            
            
            
            .padding(.all)
            
//            Using HStack
//            .overlay(HStack {
//                Image(systemName: imageName)
//                Text(text)
//            })
            
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello",imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
