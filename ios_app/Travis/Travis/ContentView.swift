//
//  ContentView.swift
//  Travis
//
//  Created by Pablo Bottero on 25/1/22.
//

import SwiftUI
import MapKit
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
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
            VStack{
                PieChartView(data: [70, 30,], title: "Prueba")
                
                LineView(data: [10, 30, 40, 90], title: "Uff")
                Spacer()
                
            }
            HStack(alignment: .center, spacing: 15.0){
                MedalsChart(medal: "triangle.fill", wi: 75, he: 75)
                MedalsChart(medal: "hexagon.fill", wi: 75, he: 75)
                MedalsChart(medal: "shield.fill", wi: 85, he: 85)
                MedalsChart(medal: "diamond.fill", wi: 75, he: 75)
            }
            
            VStack(alignment: .center) {
                Text("División Shield")
                    .font(.title)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                Text("Te faltan 10 puntos para avanzar a la siguiente división ")
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing], 25)

            }
            
            VStack(alignment: .leading) {
                Text("74 puntos")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 25)
                    .background(Color(hue: 0.488, saturation: 0.77, brightness: 0.876))
                    .cornerRadius(10)
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

struct MedalsChart: View {
    var medal: String
    var wi: CGFloat
    var he: CGFloat
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: medal)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: wi, height: he)
                .padding(5.0)
                .background(Color(hue: 0.488, saturation: 0.77, brightness: 0.876))
                .cornerRadius(20)
        }
    }
}
