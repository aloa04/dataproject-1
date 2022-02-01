//
//  ContentView.swift
//  Travis
//
//  Created by Pablo Bottero on 25/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
        HStack {
            Image("memoji")
                .resizable()
                .frame(width: 100.0, height: 110.0)
            VStack(alignment: .leading) {
                Text("Bienvenido, Pedro")
                    .font(.system(size:32, weight: .medium, design: .default))
                Text("Miembro desde 2022")
            }
        }
            Spacer()
    }
}
}


struct ContentView_Previews:
    PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
