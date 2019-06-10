//
//  Data.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/10.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

//DataでMoodelsの階層に位置してるファイルなのにView系のライブラリインポートしてんの気持ち悪いな
import UIKit
import SwiftUI
import CoreLocation

//そしてグローバルなの。。
let landmarkData: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    //指定された名前と拡張子でファイル返す
    //extentionは拡張子がないと想定して第一引数の名前に一致するファイルを返す
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    //CGImage: CoreGraphicsって描画フレームワークのクラス
    fileprivate typealias _ImageDictionary = [String: [Int: CGImage]]
    fileprivate var images: _ImageDictionary = [:]
    fileprivate static var originalSize = 250
    fileprivate static var scale = 2
    static var shared = ImageStore()
    
    func image(name: String, size: Int) -> Image {
        let index =  _guaranteeInitialImage(name: name)
        let sizedImage = images.values[index][size] ?? _sizeImage(images.values[index][ImageStore.originalSize]!, to: size * ImageStore.scale)
        images.values[index][size] = sizedImage
        return Image(sizedImage, scale: Length(ImageStore.scale), label: Text(verbatim: name))
    }
    fileprivate func _guaranteeInitialImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        guard let url = Bundle.main.url(forResource: name, withExtension: "jpg"), let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil), let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        
        images[name] = [ImageStore.originalSize: image]
        return images.index(forKey: name)!
        }
    fileprivate func _sizeImage(_ image: CGImage, to size: Int) -> CGImage {
        guard let colorSpace = image.colorSpace, let context = CGContext(data: nil, width: size, height: size, bitsPerComponent: image.bitsPerComponent, bytesPerRow: image.bytesPerRow, space: colorSpace, bitmapInfo: image.bitmapInfo.rawValue) else {
            fatalError("Couldn't creat graphics context.")
        }
        context.interpolationQuality = .high
        context.draw(image, in: CGRect(x: 0, y: 0, width: size, height: size))
        
        if let sizeImage = context.makeImage() {
            return sizeImage
        } else {
            fatalError("Couldn't resize image.")
        }
    }
}

