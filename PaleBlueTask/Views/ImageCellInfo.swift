//
//  ImageCellInfo.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import SwiftUI

struct ImageCellInfo: View {
  let image: ImageDataDisplay
  
    var body: some View {
      HStack(spacing: 15) {
        ImageView(url: image.previewURL) // KingFisher
          .aspectRatio(contentMode: .fit)
          .clipShape(RoundedRectangle(cornerRadius: 10))

        
        VStack(spacing: 5) {
          Text("Author: \n\(image.user)")
            .foregroundStyle(.black)
            .font(.system(size: 16, weight: .light))
            .lineLimit(2)
          
          Text("PhotoID: \n\(image.imageId)")
            .foregroundStyle(.black.opacity(0.5))
            .font(.system(size: 12, weight: .light))
        }
      }
      .padding()
      .background(.black.opacity(0.2))
      .clipShape(RoundedRectangle(cornerRadius: 20))
      .frame(height: 150)
    }
}

