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
            FeatureCard(title: "Featuring Alan Walker", subtitle: "Alan Walker & Similar Artists\nStation", text: nil, color: Color(#colorLiteral(red: 0.1098039216, green: 0.1568734348, blue: 0.1333114803, alpha: 1)), imageName: "AlanWalker")
            FeatureCard(title: "Take a Load Off", subtitle: "Acoustic Hits", text: "Pop hits stripped to their bare,\nbeautiful essentials.", color: Color(#colorLiteral(red: 0.7372552752, green: 0.3804122806, blue: 0.2196018994, alpha: 1)), imageName: "AcousticHits")
            FeatureCard(title: "Featuring Bruno Mars", subtitle: "Pure Romance", text: "Sparks fly in our all-time\nfavourite love songs.", color: Color(#colorLiteral(red: 0.7882060409, green: 0.6078792214, blue: 0.6469835639, alpha: 1)), imageName: "PureRomance")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
