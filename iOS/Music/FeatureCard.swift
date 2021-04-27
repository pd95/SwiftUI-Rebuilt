//
//  FeatureCard.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 18.03.21.
//

import SwiftUI

struct FeatureCard: View {
    let title: String
    let subtitle: String?
    let text: String?
    let color: Color
    let imageName: String
    
    init(_ pick: FeaturePick) {
        title = pick.title
        subtitle = pick.subtitle
        text = pick.text
        color = pick.color
        imageName = pick.imageName
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 2)

            VStack(spacing: 0) {

                featureImage

                VStack(spacing: 3) {
                    subtitle.map(Text.init)
                        .font(Font.subheadline.bold())

                    text.map(Text.init)
                        .font(.subheadline)
                }
                .padding(.bottom, 4)
                .multilineTextAlignment(.center)
                .lineSpacing(-2.0)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 85)
            }
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .secondary, radius: 5)
            .padding(.bottom, 10)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: 250)
    }

    var featureImage: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250, height: 250, alignment: .center)
    }
}



struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FeatureCard(FeaturePick.topPicks[0])
            FeatureCard(FeaturePick.topPicks[1])
            FeatureCard(FeaturePick.topPicks[2])
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
