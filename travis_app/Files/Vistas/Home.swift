//
//  Home.swift
//  Travis (iOS)
//
//  Created by Pablo Bottero on 25/1/22.
//

import SwiftUI
import MapKit

struct Home: View {
    var body: some View {
        
        // Home View...
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 18){
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("¡Hola Pedro!")
                            .font(.title.bold())
                        
                        Text("Miembro desde 2022")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 10)
                    
                    Button {
                        
                    } label: {
                        
                        // Icono de notificaciones
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .overlay(
                            
                                Text("2")
                                    .font(.caption2.bold())
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 11, y: -12),
                                
                                alignment: .topTrailing
                            )
                            .offset(x: -2)
                            .padding(15)
                            .background(Color.white)
                            .clipShape(Circle())
                    }

                }
                
                // Graph View....
                BarGraph(downloads: downloads)
                
                // Tipo de transporte
                
                HStack(spacing: 0){
                    
                    // Progreso
                    UserProgress(title: "Caminando", color: Color("LightBlue"), image: "figure.walk", progress: 68)
                    
                    UserProgress(title: "En Bici", color: Color.red, image: "bicycle", progress: 32)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(18)
                
                // Puntos del mes y la división en la que está
                VStack{
                    
                    HStack{
                        
                        Text("División Oro")
                            .font(.callout.bold())
                        
                        Spacer()
                        
                        Menu {
                            
                            Button("More"){}
                            Button("Extra"){}
                            
                        } label: {
                            
                            Image("menu")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 18, height: 18)
                                .foregroundColor(.primary)
                        }
                    }

                    HStack(spacing: 15){
                    
                        Spacer(minLength: 0)
                        UserProgress(title: "¡Estás a 10 puntos de la próxima división!", color: Color.yellow, image: "figure.walk", progress: 70)
                            
                        
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                    .padding(.top,20)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(18)
            }
            
            // ÚLTIMO HITO
            VStack{
                
                HStack{
                    
                    Text("Tu último hito")
                        .font(.callout.bold())
                    Spacer()
                    Menu {
                        Button("More"){}
                        Button("Extra"){}
                    } label: {
                        Image("menu")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(.primary)
                    }
                }

                HStack(spacing: 15){
                    
                    Image(systemName: "flame.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                        .padding(12)
                        .background(
                        
                            Color.gray
                                .opacity(0.25)
                                .clipShape(Circle())
                        )
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Has caminado un 30% más esta semana")
                            .fontWeight(.bold)
                        Text("¡Compártelo con tus amigxs!")
                            .font(.caption2.bold())
                            .foregroundColor(.gray)
                    }
                    Spacer(minLength: 10)
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                        .foregroundColor(.green)
                }
                .padding(.top,20)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(18)
            .padding(.vertical)
            
            // Comparativa usuarios
            VStack{
                
                HStack{
                    
                    Text("Compárate con otros usuarios")
                        .font(.callout.bold())
                    Spacer()
                    Menu {
                        Button("More"){}
                        Button("Extra"){}
                    } label: {
                        Image("menu")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(.primary)
                    }
                }

                HStack(spacing: 15){
                    
                    Image(systemName: "person.3")
                        .font(.title2)
                        .foregroundColor(.red)
                        .padding(15)
                        .background(
                        
                            Color.gray
                                .opacity(0.25)
                                .clipShape(Circle())
                        )
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Te estás moviendo un 15% más que otros usuarios de tu zona y edad")
                            .fontWeight(.bold)
                        Text("Eso significa que caminas de media 7,71 km por semana")
                            .font(.caption2.bold())
                            .foregroundColor(.gray)
                    }
                    Spacer(minLength: 10)
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                        .foregroundColor(.green)
                }
                .padding(.top,20)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(18)
            .padding(.vertical)
        }
        .padding()
    }
    
    @ViewBuilder
    func UserProgress(title: String,color: Color,image: String,progress: CGFloat)->some View{
        
        HStack{
            
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(color)
                .padding(10)
                .background(
                
                    ZStack{
                        
                        Circle()
                            .stroke(Color.gray.opacity(0.3),lineWidth: 2)
                        
                        Circle()
                            .trim(from: 0, to: progress / 100)
                            .stroke(color,lineWidth: 2)
                            .rotationEffect(.init(degrees: -90))
                    }
                )
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text("\(Int(progress))%")
                    .fontWeight(.bold)
                
                Text(title)
                    .font(.caption2.bold())
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
