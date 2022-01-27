//
//  TimelineScrollView.swift
//  Arc Mini
//
//  Created by Matt Greenfield on 3/4/20.
//  Copyright © 2020 Matt Greenfield. All rights reserved.
//

import SwiftUI

struct TimelineScrollView: View {

    @EnvironmentObject var timelineState: TimelineState

    var body: some View {
        Pager(pageCount: timelineState.dateRanges.count, currentIndex: $timelineState.currentCardIndex) {
            ForEach(timelineState.dateRanges) { dateRange in
                TimelineDayView(timelineSegment: RecordingManager.store.segment(for: dateRange))
            }
        }
        .background(Color("background"))
    }
    
}
