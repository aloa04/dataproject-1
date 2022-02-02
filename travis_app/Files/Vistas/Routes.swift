//
//  Routes.swift
//  Travis (iOS)
//
//  Created by Pablo Bottero on 2/2/22.
//

import SwiftUI

struct Routes: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    Text("Tus rutas destacadas")
                        .font(.title.bold())
                        .multilineTextAlignment(.center)
                    Text("¡Buen trabajo! Sigue así para subir de nivel.")
                        .multilineTextAlignment(.center)
                        .padding(.bottom)

                    Text("3 de enero de 2022 - 3,2 km ")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Image("5")
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180)
                        .padding(.top, 10.0)
                        .padding([.leading, .bottom, .trailing])
                    Text("7 de enero de 2022 - 6,5 km ")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10.0)
                    MapsRoutes()
                        .frame(height: 180)
                        .padding(.top, 10.0)
                        .padding([.leading, .bottom, .trailing])
                    Text("14 de enero de 2022 - 3,7 km ")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Image("2")
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180)
                        .padding(.top, 10.0)
                        .padding([.leading, .bottom, .trailing])
                    Text("27 de enero de 2022 - 4,2 km ")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Image("3")
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180)
                        .padding(.top, 10.0)
                        .padding([.leading, .bottom, .trailing])
                }
            }
}

struct Routes_Previews: PreviewProvider {
    static var previews: some View {
        Routes()
    }
}
}
