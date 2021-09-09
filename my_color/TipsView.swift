//
//  TipsView.swift
//  my_color
//
//  Created by Sam Gundotra on 8/26/21.
//

import Foundation

import SwiftUI

struct TipsView: View {
    let tips: [Tip]

    init() {
        let url = Bundle.main.url(forResource: "tips-copy", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        tips = try! JSONDecoder().decode([Tip].self, from: data)
    }

    var body: some View {
        List(tips, id: \.text, children: \.children) { tip in
            if tip.children != nil {
                Label(tip.text, systemImage: "questionmark.circle")
                    .font(.headline)
            } else {
                Text(tip.text)
            }
        }
        .navigationTitle("Info")
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
