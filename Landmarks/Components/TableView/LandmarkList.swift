//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/11.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        //tableVeiwはListに
//        List {
//            LandmarkRow(landmark: landmarkData[0])
//            LandmarkRow(landmark: landmarkData[1])
//        }
        //これが
        
        NavigationView {
            List(landmarkData) { landmark in
                NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
                //titleをつけるのはList
            .navigationBarTitle(Text("Landmarks"))
        //こう
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        .previewDevice(PreviewDevice(rawValue: "iPhone XR"))
    }
}
