//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/11.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    //redux感
    @State var showFavoriteOnly = false
    
    var body: some View {
        //tableVeiwはListに
//        List {
//            LandmarkRow(landmark: landmarkData[0])
//            LandmarkRow(landmark: landmarkData[1])
//        }
        //これが
        NavigationView {
            //Listで繰り返し処理をするとデータの数だけcellを返してしまうためForEachを使ってる
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites only")
                }
                ForEach(landmarkData) { landmark in
                    if !self.showFavoriteOnly || landmark.isFavorite { NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                    //titleをつけるのはList
                .navigationBarTitle(Text("Landmarks"))
            //こう
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //キャンバスで確認したいデバイスを複数登録できる にしても文字列なのね
        ForEach(["iPhone SE", "iPhone X"].identified(by: \.self)) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName ))
            .previewDisplayName(deviceName)
        }

    }
}
