//
//  MapView.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/09.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI
import MapKit

    //The UIViewRepresentable protocol は2つのメソッドにの記入が必要
    //makeUIView(context:) method that creates an MKMapView
    //updateUIView(_:context:) method that configures the view and responds to any changes.

struct MapView : UIViewRepresentable {
    //init()
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    //viewDidLoad
    func updateUIView(_ view: MKMapView, context: Context) {
        let coodinate = CLLocationCoordinate2D(
        latitude: 34.011286, longitude: -116.166868)
        //縮尺
        let span =  MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        //経緯度・縮尺で表示範囲の指定
        let region = MKCoordinateRegion(center: coodinate, span: span)
        view.setRegion(region, animated: true)
    }
}

#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
