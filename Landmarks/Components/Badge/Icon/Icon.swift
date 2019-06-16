//
//  Icon.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/16.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI

//ここで背景とシンボル合体
struct Icon : View {
    static let rotationCount = 8
    var badgeSymbols: some View {
        ForEach(0..<Icon.rotationCount) { i in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(Icon.rotationCount)) * 360.0
            )
        }
        //不透明度
        .opacity(0.5)
    }
    var body: some View {
        ZStack {
            BadgeBackground()
            GeometryReader { geometry in
            self.badgeSymbols
                //シンボルのサイズを画面サイズにた応じて可変にさせる(そもそも小さくする)
                .scaleEffect(1.0 / 4.0, anchor: .top)
                .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

#if DEBUG
struct Icon_Previews : PreviewProvider {
    static var previews: some View {
        Icon()
    }
}
#endif
