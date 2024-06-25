//
//  ContentView.swift
//  CameraApp
//
//  Created by Jesus Guerra on 6/25/24.
//

import Photos
import SwiftUI

struct ContentView: View {
    @State private var isShowingCamera = false
    @State private var image: UIImage?
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                Button("Save Photo") {
                    savePhotoToLibrary(image)
                }
                .padding()
            } else {
                Text("No Image Selected")
                    .foregroundColor(.gray)
                    .frame(width: 150, height: 150)
                    .background(Color.black.opacity(0.1))
            }
            Button("Capture Photo") {
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    isShowingCamera = true
                } else {
                    alertMessage = "Camera is not available on this device."
                    showAlert = true
                }
            }
            .padding()
        }
        .fullScreenCover(isPresented: $isShowingCamera) {
            CameraView(isPresented: $isShowingCamera, image: $image)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Notice"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    func savePhotoToLibrary(_ image: UIImage) {
        PHPhotoLibrary.requestAuthorization { status in
            guard status == .authorized else { return }

            PHPhotoLibrary.shared().performChanges {
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            } completionHandler: { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.image = nil
                        self.alertMessage = "Photo saved successfully."
                        self.showAlert = true

                    } else if let error = error {
                        DispatchQueue.main.async {
                            self.alertMessage = "Error saving photo: \(error.localizedDescription)"
                            self.showAlert = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
