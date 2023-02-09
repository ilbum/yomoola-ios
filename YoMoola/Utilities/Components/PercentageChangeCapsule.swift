//
//  PercentageChangeCapsule.swift
//  YoMoola
//
//  Created by Blue Heron on 2/8/23.
//

import SwiftUI

struct PercentageChangeCapsule: View {
    var percentChange: Float
    var changeString: String {
        if percentChange >= 0 {
            return "▲ +%\(percentChange)"
        } else {
            return "▼ -%\(abs(percentChange))"
        }
    }
    var body: some View {
        Text(changeString)
            .foregroundColor(.white)
            .padding(.horizontal, 10.0)
            .padding(.vertical, 1.0)
            .background(Capsule().fill(percentChange >= 0 ? Color.accentColor : Color.red))
    }
}

struct PercentageChangeCapsuleWhite: View {
    var percentChange: Float
    var changeString: String {
        if percentChange >= 0 {
            return "▲ +%\(percentChange)"
        } else {
            return "▼ -%\(abs(percentChange))"
        }
    }
    var body: some View {
        Text(changeString)
            .foregroundColor(percentChange >= 0 ? Color.accentColor : Color.red)
            .padding(.horizontal, 10.0)
            .padding(.vertical, 1.0)
            .background(Capsule().fill(.white))
    }
}

struct PercentageChangeCapsule_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenScrollView {
            Spacer().frame(height: 300)
            VStack(spacing: 20) {
                PercentageChangeCapsule(percentChange: 20.00)
                PercentageChangeCapsule(percentChange: -10)
                PercentageChangeCapsuleWhite(percentChange: 20.01)
                PercentageChangeCapsuleWhite(percentChange: -10)
            }
        }
    }
}
