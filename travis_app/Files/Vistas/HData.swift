//
//  HData.swift
//  Travis (iOS)
//
//  Created by Pablo Bottero on 2/2/22.
//

import SwiftUI

struct HData: View {
    
    @State var cards: [Card] = [
    
        Card(cardColor: Color("blue"),date: "Datos importantes", title: "Tu Colesterol \nestá bajo control."),
        Card(cardColor: Color("purple"),date: "Datos importantes", title: "Bebida."),
        Card(cardColor: Color("green"),date: "Datos importantes", title: "Presión sanguinea."),
        Card(cardColor: Color("pink"),date: "Datos importantes", title: "La importancia de \ndejar de fumar."),
        Card(cardColor: Color("yellow"),date: "Datos importantes", title: "Hace mucho que \nno te pesas."),
    ]
    

    @State var showDetailPage: Bool = false
    @State var currentCard: Card?

    @Namespace var animation
    
    @State var showDetailContent: Bool = false
    
    var body: some View {
        
        VStack{
            

            HStack(alignment: .bottom){
                
                VStack(alignment: .leading){
                    
                    Text("Resumen de tu salud")
                        .font(.largeTitle.bold())
                        .padding(.bottom)
                    
                    Label {
                        Text("Tu información, segura.")
                    } icon: {
                        Image(systemName: "heart.circle")
                            .foregroundColor(Color.red)
                    }

                }
                
                Spacer()
                
                Text("Actualizado a las 13:30 de hoy")
                    .font(.caption2)
                    .fontWeight(.light)
            }
            
            GeometryReader{proxy in
                
                let size = proxy.size

                let trailingCardsToShown: CGFloat = 2
                let trailingSpaceofEachCards: CGFloat = 20
                
                ZStack{
                 
                    ForEach(cards){card in
                        
                        InfiniteStackedCardView(cards: $cards, card: card,trailingCardsToShown: trailingCardsToShown,trailingSpaceofEachCards: trailingSpaceofEachCards,animation: animation,showDetailPage: $showDetailPage)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    currentCard = card
                                    showDetailPage = true
                                }
                            }
                    }
                }
                .padding(.leading,10)
                .padding(.trailing,(trailingCardsToShown * trailingSpaceofEachCards))
                .frame(height: size.height / 1.6)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .padding()
        // Moving view to Top without using Spacers...
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .overlay(
        
            DetailPage()
        )
    }
    
    @ViewBuilder
    func DetailPage()->some View{
        ZStack{
            
            if let currentCard = currentCard,showDetailPage {
                
                Rectangle()
                    .fill(currentCard.cardColor)
                    .matchedGeometryEffect(id: currentCard.id, in: animation)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Button {
                        withAnimation{
                            // Closing View..
                            showDetailContent = false
                            showDetailPage = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    Text(currentCard.date)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.top)

                    Text(currentCard.title)
                        .font(.title.bold())
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        Text(content)
                            .kerning(1.1)
                            .lineSpacing(8)
                            .multilineTextAlignment(.leading)
                            .padding(.top,10)
                    }
                }
                .opacity(showDetailContent ? 1 : 0)
                .foregroundColor(.white)
                .padding()
                // Moving view to top Without Any Spacers..
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        
                        withAnimation{
                            showDetailContent = true
                        }
                    }
                }
            }
        }
    }
}

struct HData_Previews: PreviewProvider {
    static var previews: some View {
        HData()
    }
}

struct InfiniteStackedCardView: View{
    
    @Binding var cards: [Card]
    var card: Card
    var trailingCardsToShown: CGFloat
    var trailingSpaceofEachCards: CGFloat
    
    var animation: Namespace.ID
    @Binding var showDetailPage: Bool
    
    @GestureState var isDragging: Bool = false
    // Used to store Offset..
    @State var offset: CGFloat = .zero
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 15) {
            
            Text(card.date)
                .font(.caption)
                .fontWeight(.semibold)
                
            Text(card.title)
                .font(.title.bold())
                .padding(.top)
            
            Spacer()
            
            Label {
                Image(systemName: "arrow.right")
            } icon: {
                Text("Conoce su importancia")
            }
            .font(.system(size: 15, weight: .semibold))
            // Moving To right without Spacers...
            .frame(maxWidth: .infinity,alignment: .trailing)

        }
        .padding()
        .padding(.vertical,10)
        .foregroundColor(.white)
        .background(
        
            ZStack{

                RoundedRectangle(cornerRadius: 25)
                    .fill(card.cardColor)
                    .matchedGeometryEffect(id: card.id, in: animation)
            }
        )
        .padding(.trailing,-getPadding())
        .padding(.vertical,getPadding())
        .zIndex(Double(CGFloat(cards.count) - getIndex()))
        .rotationEffect(.init(degrees: getRotation(angle: 10)))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .offset(x: offset)
        .gesture(
        
            DragGesture()
                .updating($isDragging, body: { _, out, _ in
                    out = true
                })
                .onChanged({ value in
                    
                    var translation = value.translation.width
                    translation = cards.first?.id == card.id ? translation : 0
                    translation = isDragging ? translation : 0
                    translation = (translation < 0 ? translation : 0)
                    
                    offset = translation
                })
                .onEnded({ value in
                    
                    let width = UIScreen.main.bounds.width
                    let cardPassed = -offset > (width / 2)
                    
                    withAnimation(.easeInOut(duration: 0.2)){
                        
                        if cardPassed{
                            offset = -width
                            removeAndPutBack()
                        }
                        else{
                         
                            offset = .zero
                        }
                    }
                })
        )
    }
    

    func removeAndPutBack(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            var updatedCard = card
            updatedCard.id = UUID().uuidString
            
            cards.append(updatedCard)
            
            withAnimation {
                cards.removeFirst()
            }
        }
    }
    

    func getRotation(angle: Double)->Double{
        let width = UIScreen.main.bounds.width - 50
        let progress = offset / width
        
        return Double(progress) * angle
    }
    
    func getPadding()->CGFloat{
        let maxPadding = trailingCardsToShown * trailingSpaceofEachCards
        let cardPadding = getIndex() * trailingSpaceofEachCards
        return (getIndex() <= trailingCardsToShown ? cardPadding : maxPadding)
    }
    
    func getIndex()->CGFloat{
        
        let index = cards.firstIndex { card in
            return self.card.id == card.id
        } ?? 0
        
        return CGFloat(index)
    }
}


let content = "Puestos a buscar razones para dejar de fumar, se pueden encontrar cientos de ellas. Y muchas de ellas se pueden hallar en la primera y la más importante: la salud. Bastará destacar algunas de ellas:\n\n1.Fumar mata, por lo que dejar de fumar alargará la esperanza de vida.\n\n2.Evitar el cáncer. El tabaco se ha identificado como la causa de numerosos tipos de cáncer y entre ellos, especialmente el de pulmón, garganta, vejiga o boca, por citar algunos.\n\n3.Mejorar la salud cardiovascular, mejorando la tensión arterial y la frecuencia cardiaca, entre otros factores.\n\n4.Evitar la insuficiencia respiratoria o enfermedades como la EPOC.\n\n5.Reducir la posibilidad de sufrir infecciones de las vías respiratorias.\n\n6.Mejorar la fertilidad.\n\n7.No tener problemas de disfunción eréctil.\n\n8.Evitar el envejecimiento prematuro de la piel y la aparición de arrugas."

