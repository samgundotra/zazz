//
//  ClothingColorView.swift
//  my_color
//
//  Created by Sam Gundotra on 8/26/21.
//

import Foundation

import SwiftUI

struct ClothingColorView: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    var body: some View {
        //        Text("Hello, world!")
        //            .padding()
        NavigationView {
            VStack {
                Text("Upload an image with the color of your clothing item.")
                    .multilineTextAlignment(.center)
                    .padding()

                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                } else {
//                    Image(systemName: "snow")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .clipShape(Circle())
//                        .frame(width: 296.0, height: 300)
                }
                
                Button("Camera") {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                }.padding()
                
                Button("Photo Library") {
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
                }.padding()
                
//                Button("next") {
//
//                }
            }
            .navigationBarTitle("Step 2:")
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
            
        }
        
    }
}

struct ClothingColorView_Previews: PreviewProvider {
    static var previews: some View {
        ClothingColorView()
    }
}

