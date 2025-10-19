//
//  SettingsView.swift
//  ScoreKeeper
//
//  Created by Amari Duran on 10/17/25.
//

import SwiftUI

struct SettingsView: View {

    /// A @Binding connects a property to a source of truth stored elsewhere,
    /// instead of storing data directly.
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
            Picker("Starting points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    /// The @Previewable macro lets you use dynamic properties inline in previews.
    /// It's only used inside a #Preview body.
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints = 10
    SettingsView(
        doesHighestScoreWin: $doesHighestScoreWin,
        startingPoints: $startingPoints
    )
}
