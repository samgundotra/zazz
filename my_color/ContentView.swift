//
//  ContentView.swift
//  my_color
//
//  Created by Sam Gundotra on 8/13/21.
//

import SwiftUI


struct ContentView: View {
    
    @State private var sourceType1: UIImagePickerController.SourceType = .camera
    @State private var sourceType2: UIImagePickerController.SourceType = .camera
    @State private var selectedImage1: UIImage?
    @State private var selectedImage2: UIImage?
    @State private var isImagePickerDisplay1 = false
    @State private var isImagePickerDisplay2 = false
    
    var body: some View {
        //        Text("Hello, world!")
        //            .padding()
        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
                    HStack{
                        Spacer()
                        NavigationLink(
                            destination: TipsView(),
                            label: {
                                Image(systemName: "info.circle")
                                    .font(Font.system(.title2))
                            }).padding(.all)
                    }
                    Text("Getting Started")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                    VStack {
//                        Text("Step 1:")
                        Text("Upload an image of your skin")
                            .font(.title)
                            .fontWeight(.light)
                            .bold()
                            .multilineTextAlignment(.center)
                        
//                        Text("Upload an image of your skin")
//                            .fontWeight(.light)
//                            .padding()
                        
                        if selectedImage1 != nil {
                            Image(uiImage: selectedImage1!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 300, height: 300)
                        }
                        
                        Button("Camera") {
                            self.sourceType1 = .camera
                            self.isImagePickerDisplay1.toggle()
                        }.padding(20)
                        
                        Button("Photo Library") {
                            self.sourceType1 = .photoLibrary
                            self.isImagePickerDisplay1.toggle()
                        }.padding(.bottom)
                    }
                    VStack {
                        Text("Upload an image with the color of your clothing item.")
                            .font(.title)
                            .fontWeight(.light)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.top)
//                        Text("Step 2:")
//                            .font(.title)
//                            .fontWeight(.medium)
//                            .bold()
//                            .multilineTextAlignment(.center)
//                            .padding(.top)
                        
//                        Text("Upload an image with the color of your clothing item.")
//                            .fontWeight(.light)
//                            .multilineTextAlignment(.center)
//                            .padding()
                        
                        if selectedImage2 != nil {
                            Image(uiImage: selectedImage2!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 300, height: 300)
                        }
                        
                        Button("Camera") {
                            self.sourceType2 = .camera
                            self.isImagePickerDisplay2.toggle()
                        }.padding(15)
                        
                        Button("Photo Library") {
                            self.sourceType2 = .photoLibrary
                            self.isImagePickerDisplay2.toggle()
                        }.padding(.horizontal)
                    }
                    if (selectedImage1 != nil && selectedImage2 != nil) {
                        NavigationLink(
                            destination: MatchView(skinImage: selectedImage1, clothingImage: selectedImage2),
                            label: {
                                Text("is it a match? ...")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }).padding()
                    }
                }
            }
            
            .navigationBarTitle("Home")
            .navigationBarHidden(true)
            
            .sheet(isPresented: self.$isImagePickerDisplay1) {
                ImagePickerView(selectedImage: self.$selectedImage1, sourceType: self.sourceType1)
            }
            .sheet(isPresented: self.$isImagePickerDisplay2) {
                ImagePickerView(selectedImage: self.$selectedImage2, sourceType: self.sourceType2)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

