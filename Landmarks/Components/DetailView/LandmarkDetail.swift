//
//  ContentView.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/05.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI

//combine compornents
struct LandmarkDetail : View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    //いいねの更新に使用 配列から該当のlandmarkの最新のidをとってくる
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)

            CircleImage(image: landmark.image(forSize: 250))
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        Button(action: {
                            self.userData.landmarks[self.landmarkIndex].isFavorite.toggle() //toggleはBoolに生えてる
                        }) {
                                if self.userData.landmarks[self.landmarkIndex].isFavorite {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                } else {
                                    Image(systemName: "star")
                                        .foregroundColor(.gray)
                            }
                        }
                    }
                    HStack(alignment: .top) {
                        Text(landmark.park)
                            .font(.caption)
                        Spacer()
                        Text(landmark.state)
                            .font(.caption)
                    }
                }
            .padding()
            
            Spacer()
        }
            .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
        .environmentObject(UserData())
    }
}
#endif
