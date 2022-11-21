//
//  TitleThenIconLabelStyle.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 16/11/2022.
//

import SwiftUI

/// The relative layout of the title and icon is dependent on the context it
/// is displayed in. In this case, however, the label is arranged
/// horizontally with the icon trailing.
struct IconAndTitleLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 3) {
            configuration.title
            configuration.icon
        }
    }
}
