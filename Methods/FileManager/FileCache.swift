//
//  FileCache.swift
//  UIElements
//
//  Created by Tony Chen on 4/3/2024.
//

import SwiftUI

class CacheFileManager {
    static let cacheManagerInstance = CacheFileManager()
    
    private init() {  }
    
    // Custom cache
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100 // Total number of files can be saved in cache
        cache.totalCostLimit  = 1024 * 1024 * 100 // Total number of data size saved in cache
        return cache
    }()
    
    func add(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "Add to cache"
    }
    
    func remove(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed from cache"
    }
    
    // Use optional return incase there is nil
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
    
}

class CacheViewModel: ObservableObject {
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var cacheMessage: String = ""
    private let imageName: String = "Flower"
    private let cacheFM = CacheFileManager.cacheManagerInstance
    
    init() {
        getImageFormAssetsFolder()
    }
    
    func getImageFormAssetsFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        cacheMessage = cacheFM.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        cacheMessage = cacheFM.remove(name: imageName)
    }
    
    func getFromCache() {
        if let returnedImage = cacheFM.get(name: imageName) {
            cachedImage = returnedImage
            cacheMessage = "Got image from cache"
        } else {
            cacheMessage = "Image not found in cache"
        }
    }
}

struct FileCache: View {
    @State var cVM = CacheViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = cVM.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .frame(width: 300, height: 300)
                }
                HStack {
                    Button(action: {
                        cVM.saveToCache()
                    }, label: {
                        Text("Save to Cache")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 20)))
                })
                    Button(action: {
                        cVM.removeFromCache()
                    }, label: {
                        Text("Delete form Cache")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.red.clipShape(RoundedRectangle(cornerRadius: 20)))
                })
                    
                    Button(action: {
                        cVM.getFromCache()
                    }, label: {
                        Text("Get form Cache")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.green.clipShape(RoundedRectangle(cornerRadius: 20)))
                })
                    
                    if let image = cVM.cachedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            .frame(width: 300, height: 300)
                    }

                }
                Text(cVM.cacheMessage)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
    
                Spacer()
            }
            .navigationTitle("Cache Manager")
        }
    }
}

#Preview {
    FileCache()
}
