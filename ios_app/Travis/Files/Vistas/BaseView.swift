//
//  BaseView.swift
//  Travis (iOS)
//
//  Created by Pablo Bottero on 25/1/22.
//

import SwiftUI

struct BaseView: View {
    
    @State var currentTab = "home"
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $currentTab) {
                
                Home()
                    .modifier(BGModifier())
                    .tag("graph")
                
                HData()
                    .modifier(BGModifier())
                    .tag("heart")
                
                Routes()
                    .modifier(BGModifier())
                    .tag("map")
                
                Ajustes()
                    .modifier(BGModifier())
                    .tag("settings")
            }
            HStack(spacing: 50){
                TabButton(image: "graph")
                TabButton(image: "heart")
                TabButton(image: "map")
                TabButton(image: "settings")
            }
            .padding(.top,20)
            .frame(maxWidth: .infinity)
            .background(Color("Zurich")
                    .ignoresSafeArea()
            )
        }
    }
    
    @ViewBuilder
    func TabButton(image: String)->some View{
        
        Button {
            withAnimation{
                currentTab = image
            }
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(
                    currentTab == image ? Color.black : Color.white
                )
        }

    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}


struct BGModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BG").ignoresSafeArea())
    }
}
