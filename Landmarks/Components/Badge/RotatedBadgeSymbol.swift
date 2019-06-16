//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/16.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol : View {
    let angle: Angle
    var body: some View {
        IconSymbol()
        .padding(-60)
        .rotationEffect(angle, anchor: .bottom)
    }
}

#if DEBUG
struct RotatedBadgeSymbol_Previews : PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 5))
    }
}
#endif
