//
//  ImageViewController.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/22/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.

import Combine
import SwiftUI

struct ImageViewController: View {
    @ObservedObject var url: LoadUrlImage

    init(imageUrl: String) {
        url = LoadUrlImage(imageURL: imageUrl)
    }

    var body: some View {
        Image(uiImage: UIImage(data: self.url.data) ?? UIImage())
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
//            .shadow(radius: 5)
            .frame(width: 60, height: 60)
    }
}

class LoadUrlImage: ObservableObject {
    @Published var data = Data()
    init(imageURL: String) {
        let cache = URLCache.shared
        let request = URLRequest(url: URL(string: imageURL)!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        if let data = cache.cachedResponse(for: request)?.data {
            self.data = data
        } else {
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response {
                let cachedData = CachedURLResponse(response: response, data: data)
                                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        self.data = data
                    }
                }
            }).resume()
        }
    }
}

struct ImageViewController_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewController(imageUrl: defaultPhoto)
    }
}
