//
//  CircleImage.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/09.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("turtlerock")
        .clipShape(Circle())
            //円形に合わせてグレーのラインをひく
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif
