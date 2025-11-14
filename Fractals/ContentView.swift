//
//  ContentView.swift
//  Fractals
//
//  Created by Angelos Staboulis on 14/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var depth: Double = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
                   SierpinskiTriangle(depth: Int(depth))
                       .stroke(Color.blue, lineWidth: 1)
                       .padding()
                       .onReceive(timer) { value in
                           if depth == 8 {
                               depth = 0
                           }else{
                               depth = depth + 1
                           }
                       }
               
               }
           }
}

#Preview {
    ContentView()
}
