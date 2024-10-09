//
//  SystemImageView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-09.
//

import SwiftUI

struct ResizeImageView: View {
  @State private var variableValue: CGFloat = 0
  @State private var resizingMode: Image.ResizingMode = .stretch
  @State private var symbolsApp = "sf-symbols"
  @State private var bigBuckBunny = "bbb-splash"
  var body: some View {
    ScrollView{
      VStack(spacing: 20) {
        Image(symbolsApp)
          .block()
        Swifty(code:
        """
        Image(symbolsApp)
        """
        )
        Divider()
        
        Image(symbolsApp)
          .resizable(resizingMode: .stretch)
          .block()
        Swifty(code:
        """
        Image(symbolsApp)
          .resizable(resizingMode: .stretch)
        """
        )
        Divider()
        
        Image(symbolsApp)
          .resizable(resizingMode: .tile)
          .block()
        Swifty(code:
        """
        Image(symbolsApp)
          .resizable(resizingMode: .tile)
        """
        )
        Divider()
        
        Image(bigBuckBunny)
          .frame(width: 200, height: 200)
          .aspectRatio(contentMode: .fill)
          .clipped() // Crop the image to the frame size
          .block()
        Swifty(code:
        """
        Image(bigBuckBunny)
          .frame(width: 200, height: 200)
          .aspectRatio(contentMode: .fill)
          .clipped()
        """
        )
        Divider()
        
        Image(bigBuckBunny)
          .resizable()
          .frame(width: 200, height: 200)
          .aspectRatio(contentMode: .fit)
          .clipped() // Crop the image to the frame size
          .block()
        Swifty(code:
        """
        Image(bigBuckBunny)
          .frame(width: 200, height: 200)
          .aspectRatio(contentMode: .fit)
          .clipped()
        """
        )
        Divider()
        
        Image(bigBuckBunny)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 200, height: 200)
          .block()
        Swifty(code:
        """
        Image(bigBuckBunny)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 200, height: 200)
        // Not cropping spills outside frame
        """
        )
        Divider()
        
        Image(bigBuckBunny)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 200, height: 200)
          .clipped() // Crop the image to the frame size
          .block()
        Swifty(code:
        """
        Image(bigBuckBunny)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 200, height: 200)
          .clipped() // Crop the image to the frame
        """
        )
        Divider()
        

        
      }
    }.padding()
  }
}

#Preview {
  ResizeImageView()
}
