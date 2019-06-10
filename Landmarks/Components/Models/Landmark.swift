//
//  Landmark.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/09.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    //privateは定義したクラス内のみ
    //filepriavateは定義したファイル内
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    func image(forSize size: Int) -> Image {
       //ImamageStore自家製かいな😇
        ImageStore.shared.image(name: imageName, size: size)
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
    
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
