//
//  CircleImage.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/09.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var image: Image
    var body: some View {
        //特定のImageのインスタンスではなくプロパティで抽象化
        
        image
        .clipShape(Circle())
            //円形に合わせてグレーのラインをひく
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        //具体的なデータはここ
        CircleImage(image: Image("turtlerock"))
    }
}
#endif
