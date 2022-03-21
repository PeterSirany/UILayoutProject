//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

struct PhotosPage: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image = Image(systemName: "photo.on.rectangle.angled")
    @State public var data: Data?
    @State private var optionalData = UIImage(systemName: "photo.on.rectangle.angled")?.jpegData(compressionQuality: 1)
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 20) {
                
                if data != nil {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(0.9)
                        .foregroundColor(Color.containerColor)
                        .onTapGesture(count: 2, perform: { showImagePicker = true})
                    
                } else {
                    image
                        .font(.largeTitle)
                        .foregroundColor(Color.logoColor)
                    Text("Select a ***Photo*** here").foregroundColor((Color.preliminaryTextColor)).onTapGesture(perform: { showImagePicker = true})
                }
                
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(data: $data)
            }
        }
    }
    
    func loadImage() {
        guard let data = data else { return }
        
        image = Image(uiImage: UIImage(data: data) ?? UIImage(systemName: "photo.on.rectangle.angled")!)
        
    }
}

struct PhotosPage_Previews: PreviewProvider {
    static var previews: some View {
        PhotosPage()
    }
}
