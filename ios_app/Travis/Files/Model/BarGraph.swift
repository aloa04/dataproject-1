//
//  BarGraph.swift
//  Travis (iOS)
//
//  Created by Pablo Bottero on 25/1/22.
//

import SwiftUI

struct BarGraph: View {
    var downloads: [Download]
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("Aquí tienes tus estadísticas")
                    .fontWeight(.bold)
                Spacer()
                Menu {
                    Button("Mes"){}
                    Button("Año"){}
                    Button("Día"){}
                } label: {
                    HStack(spacing: 4){
                        Text("Semana")
                        Image(systemName: "arrowtriangle.down.fill")
                            .scaleEffect(0.7)
                    }
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.gray)
                }

            }
            
            HStack(spacing: 10){
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            GraphView()
                .padding(.top,5)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.top,25)
    }
    
    @ViewBuilder
    func GraphView()->some View{
        GeometryReader{proxy in
            ZStack{
                VStack(spacing: 0){
                    ForEach(getGraphLines(),id: \.self){line in
                        HStack(spacing: 8){
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(height: 20)
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                        }
                        .frame(maxHeight: .infinity,alignment: .bottom)
                        .offset(y: -15)
                    }
                }
                
                HStack{
                    ForEach(downloads){download in
                        
                        VStack(spacing: 0){
                            
                            VStack(spacing: 5){
                                Capsule()
                                    .fill(Color("DarkBlue"))
                            }
                            .frame(width: 8)
                            .frame(height: getBarHeight(point: download.downloads, size: proxy.size))
                            
                            Text(download.weekDay)
                                .font(.caption)
                                .frame(height: 25,alignment: .bottom)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                }
                .padding(.leading,30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 190)
    }
    
    func getBarHeight(point: CGFloat,size: CGSize)->CGFloat{
        let max = getMax()
        let height = (point / max) * (size.height - 37)
        return height
    }
    func getGraphLines()->[CGFloat]{
        let max = getMax()
        var lines: [CGFloat] = []
        lines.append(max)
        for index in 1...4{
            let progress = max / 4
            lines.append(max - (progress * CGFloat(index)))
        }
        return lines
    }

    func getMax()->CGFloat{
        let max = downloads.max { first, scnd in
            return scnd.downloads > first.downloads
        }?.downloads ?? 0
        
        return max
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
