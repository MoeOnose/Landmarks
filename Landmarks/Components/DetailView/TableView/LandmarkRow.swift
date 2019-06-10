//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/09.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI

struct LandmarkRow : View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image(forSize: 50)
            Text(landmark.name)
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        Group  {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        //レイアウトを一部分切り出して確認 GroupGroupにしたことでレイアウトを一箇所にまとめられる
         .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
#endif
