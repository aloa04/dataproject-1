//
//  ItemSegmentsView.swift
//  Arc Mini
//
//  Created by Matt Greenfield on 28/3/20.
//  Copyright © 2020 Matt Greenfield. All rights reserved.
//

import SwiftUI
import LocoKit

struct ItemSegmentsView: View {

    @ObservedObject var timelineItem: TimelineItem
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: 24)
                Text("Segments")
                    .font(.system(size: 24, weight: .bold))
                    .padding([.leading, .trailing], 20)
                    .frame(height: 30)
                Spacer().frame(height: 4)
                Text("Each timeline item is made up of one or more recorded activities. To make corrections, tap on rows below or items on the map.")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color("brandTertiaryLight"))
                    .padding([.leading, .trailing], 20)
                Spacer().frame(height: 24)
                Text("END")
                    .font(.system(size: 10, weight: .regular))
                    .foregroundColor(Color(0xE35641))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, minHeight: 24)
                    .overlay(RoundedRectangle(cornerRadius: 9.5).stroke(Color(0xE5634F), lineWidth: 1).opacity(0.2))
                    .padding([.leading, .trailing], 20)
                Spacer().frame(height: 16)
            }
            .background(Color("background"))
            
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(self.timelineItem.segmentsByActivityType.reversed(), id: \.id) { segment in
                    NavigationLink(destination: ItemSegmentEditView(itemSegment: segment)) {
                        HStack {
                            Circle().fill(Color(segment.activityType?.color ?? UIColor.black)).frame(width: 10, height: 10)
                            if segment.isDataGap {
                                Text("Data Gap".localised() + " (\(segment.samples.count))")
                                    .font(.system(size: 17, weight: .regular))
                                    .foregroundColor(.red)
                                
                            } else {
                                Text((segment.activityType?.displayName.capitalized.localised() ?? "Unknown".localised()) + " (\(segment.samples.count))")
                                    .font(.system(size: 17, weight: .regular))
                                    .foregroundColor(Color("blackWhiteText"))
                            }
                            Spacer()
                            Text(self.rightText(for: segment))
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(Color(UIColor.arcGray1))
                        }
                    }
                    .padding([.leading, .trailing], 20)
                    .frame(height: 44)
                    .listRowInsets(EdgeInsets())
                    .background(Color("background"))
                }
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: 16)
                Text("START")
                    .font(.system(size: 10, weight: .regular))
                    .foregroundColor(Color(0xE35641))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, minHeight: 24)
                    .overlay(RoundedRectangle(cornerRadius: 9.5).stroke(Color(0xE5634F), lineWidth: 1).opacity(0.2))
                    .padding([.leading, .trailing], 20)
                Spacer().frame(height: 40)
            }
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .onAppear {
            if TimelineState.highlander.popToDetailsView {
                presentationMode.wrappedValue.dismiss()
                return
            }
            MapState.highlander.selectedItems = [self.timelineItem]
            MapState.highlander.itemSegments = self.timelineItem.segmentsByActivityType
            MapState.highlander.selectedSegments = []
            TimelineState.highlander.backButtonHidden = false
            TimelineState.highlander.todayButtonHidden = true
        }
        .onReceive(TimelineState.highlander.$tappedBackButton) { tappedBackButton in
            if tappedBackButton {
                self.presentationMode.wrappedValue.dismiss()
                TimelineState.highlander.tappedBackButton = false
            }
        }
    }

    func rightText(for segment: ItemSegment) -> String {
        guard let dateRange = segment.dateRange else { return "" }

        if segment.activityType == .bogus {
            return String(duration: dateRange.duration, style: .short)
                + ", " + formatter.string(from: dateRange.start)
        }

        if !segment.hasAnyUsableLocations {
            return "nolo, " + String(duration: dateRange.duration, style: .short)
                + ", " + formatter.string(from: dateRange.start)
        }

        if segment.activityType == .stationary {
            return String(duration: dateRange.duration, style: .short)
                + ", " + formatter.string(from: dateRange.start)
        }

        return String(metres: segment.distance, isAltitude: false)
            + ", " + String(duration: dateRange.duration, style: .short)
            + ", " + formatter.string(from: dateRange.start)
    }

}
