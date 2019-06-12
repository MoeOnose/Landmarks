//
//  Landmark.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/09.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI
import CoreLocation
//Identifiable: 識別可能にする。今までtableViewのindexと照合してたけどそれが無くなったから必要になったのでは？
//実装: protocolの批准とidプロパティの追加
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    //privateは定義したクラス内のみ
    //filepriavateは定義したファイル内
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    
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
        case mountain = "Mountains"
    }
    
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
