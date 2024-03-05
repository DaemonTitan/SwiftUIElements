//
//  FileManager.swift
//  UIElements
//
//  Created by Tony Chen on 4/3/2024.
//

import SwiftUI

class LocalFileManager {
    static let fileManagerInstance = LocalFileManager()
    private let folderName = "MyappImages"
    
    private init() {
        createFolder()
    }
    
    // MARK: Create folder path
    func createFolder() {
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathExtension(folderName)
            .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print(error)
            }
        } else {
            print("Success create folder")
        }
    }
    
    func deleteFolder() {
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathExtension(folderName)
            .path else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Delete Folder success")
        } catch let error {
            print(error)
        }
    }
    
    // MARK: Get Image Path
    func getImagePath(name: String) -> URL? {
        // Below directory returns an array
        // User generated data should go to Document directory. It is one time only.
        // Use User Domain Mask use User's home directly.
 //       let directory1 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        // Data is downloaded or regerneated goes to caches directory.
  //      let directory2 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        
        // Data is use temporary goes to temporary directory
 //       let directory3 = FileManager.default.temporaryDirectory.first
        
        guard let path = FileManager
                                .default
                                .urls(for: .cachesDirectory, in: .userDomainMask)
                                .first?
                                .appendingPathComponent(folderName)
                                .appendingPathComponent("\(name).jpg") else {
            print("Error get data")
            return nil
        }
        return path
    }
    
    // MARK: Save
    func saveImage(image: UIImage, name: String) -> String {
        // Handle Jpg data
        guard let imageData = image.jpegData(compressionQuality: 1.0),
              let path = getImagePath(name: name) else {
            return "Error get data"
            
        }
        // Handle PNG data
        //image.pngData()

        // Save file
        do {
            try imageData.write(to: path)
            print(path)
            return "Success"
        } catch let error {
            return "\(error)"
        }
    }
    
    // MARK: Retrieve
    func getSavedImage(name: String) -> UIImage? {
        guard let path = getImagePath(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
            print("Error get path")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    // MARK: Delete
    func deleteImage(name: String) -> String {
        guard let path = getImagePath(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
            return "Error get path"
            
        }
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Delete Success"
        } catch let error {
            return "\(error)"
        }
    }
}

class fileManagerViewModel: ObservableObject {
    @Published var flowerImage: UIImage? = nil
    private let imageName: String = "Flower"
    private let localFM = LocalFileManager.fileManagerInstance
    @Published var infoMessages: String = ""
    
    init() {
        //getImageFormAssetsFolder()
        getImageFromFileManager()
    }
    
    func getImageFormAssetsFolder () {
        flowerImage = UIImage(named: imageName)
        
    }
    
    func saveImage() {
        guard let image = flowerImage else { return }
        infoMessages = localFM.saveImage(image: image, name: imageName)
    }
    
    func getImageFromFileManager() {
        flowerImage = localFM.getSavedImage(name: imageName)
    }
    
    func deleteImage() {
        infoMessages = localFM.deleteImage(name: imageName)
        localFM.deleteFolder()
    }
}

struct FileManagers: View {
    @State private var fileManagerVM = fileManagerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = fileManagerVM.flowerImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .frame(width: 300, height: 300)
                }
                HStack {
                    Button(action: {
                        fileManagerVM.saveImage()
                    }, label: {
                        Text("Save to FM")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 20)))
                })
                    Button(action: {
                        fileManagerVM.deleteImage()
                    }, label: {
                        Text("Delete form FM")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.red.clipShape(RoundedRectangle(cornerRadius: 20)))
                })
                }
                Text(fileManagerVM.infoMessages)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
    
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

#Preview {
    FileManagers()
}
