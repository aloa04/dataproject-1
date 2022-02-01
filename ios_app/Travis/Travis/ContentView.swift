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
                .padding(.top, 25)
            VStack(alignment: .leading) {
                Text("Bienvenido, Pedro")
                    .font(.system(size:32, weight: .medium, design: .default))
                    .padding(.top, 25)
                Text("Miembro desde 2022")
            }
        }
            VStack {
                Text("División (3 iconos, uno de ellos con mayor tamaño")
                    .padding(.bottom, 25)
                Text("74 puntos")
                    .padding(.bottom, 25)
                Text("KM andados + 34% de la media")
                    .padding(.bottom, 25)
                Text("KM en cleta + 2% de la media")
                    .padding(.bottom, 25)
                Text("Mapa de las rutas diferenciadas según si se han hecho andando o en cleta")
                    .padding(.bottom, 25)
                Text("Grafico de la semana (con opción a mes, usando AnimatedBarCharts and Picker)")
                    .padding(.bottom, 25)
                Text("Comparativa con otros usuarios de tu rango de edad y zona")
                    .padding(.bottom, 25)
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
