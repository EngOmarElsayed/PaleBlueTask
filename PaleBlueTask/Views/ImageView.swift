//
//  KingFisherImageView.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import SwiftUI
import Kingfisher

struct ImageView: View {
  let url: String
  
  var body: some View {
      AsyncImage(url: URL(string: url)) { image in
        image
          .resizable()
      } placeholder: {
        Image(systemName: "photo")
      }
  }
}

