//
//  Ajustes.swift
//  Travis (iOS)
//
//  Created by Pablo Bottero on 2/2/22.
//

import SwiftUI

struct Ajustes: View {
    var body: some View {
        
        NavigationView{
            Form {
                Section(header: Text ( "Sobre la aplicación") , footer: Text ( "Estos ajustes son exclusivos para la aplicación y no tienen relación con tu póliza.")) {
        
                    Toggle(isOn: .constant (true), label: { Text ("Seguimiento de la ubicación")})
                    Toggle(isOn:.constant(true), label: { Text ("Compartir datos no sensibles")})
                    Toggle(isOn:.constant(true), label: { Text ("Notificaciones de logros")})
                    Toggle(isOn:.constant(true), label: { Text ("Notificaciones de tendencias")})
                    Link(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=URL@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
                        Text("Comunicarse con soporte de la aplicación")
                    }
                }
                
                Section {Label ("Contacta con Zurich", systemImage: "link")}
                Section {Label ("Conoce tu póliza", systemImage: "link")}
                Section {Label ("Desarrollado po Shonos", systemImage: "suit.heart")}
                
            }
        .navigationTitle("Ajustes")
    }
}

struct Ajustes_Previews: PreviewProvider {
    static var previews: some View {
        Ajustes()
    }
}
}
