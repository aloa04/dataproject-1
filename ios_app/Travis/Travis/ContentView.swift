//
//  ContentView.swift
//  Travis
//
//  Created by Pablo Bottero on 30/1/22.
//

import SwiftUI
import UIKit
import MapKit

struct ContentView: View {
    var body: some View {
            TabView {
        FirstView ()
            .tabItem {
                Image(systemName: "chart.bar.xaxis")
                Text("Inicio")
            }
        SecondView ()
            .tabItem {
                Image(systemName: "heart")
                Text("Salud")
            }
        ThirdView()
            .tabItem {
                Image(systemName: "person.circle.fill")
                Text("Perfil")
            }
            }
    .accentColor(Color.white)
    .onAppear {
        UITabBar.appearance().backgroundColor = UIColor.blue
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    // PRIMERA PESTAÑA - DATOS COMPARATIVOS Y PROPIOS
struct FirstView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(edges: .top)
            Text("First View")
            Image("memoji")
                .resizable()
                .scaledToFit()
        }
    }
}

    // SEGUNDA PESTAÑA - DATOS DE SALUD
struct SecondView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(edges: .top)
            Text("Second View")
        }
    }
}

    // TERCERA PESTAÑA - "DATOS DEL PERFIL"
struct ThirdView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(edges: .top)
            Text("Yhird View")
        }
    }
}

}
