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
    let landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.coordinate)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)

            CircleImage(image: landmark.image(forSize: 250))
                .offset(y: -130)
                .padding(.bottom, -130)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)
                    HStack(alignment: .top) {
                        Text(landmark.park)
                            .font(.subheadline)
                        Spacer()
                        Text(landmark.state)
                            .font(.subheadline)
                    }
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(name: landmark.name, displayMode: .inline)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
#endif
