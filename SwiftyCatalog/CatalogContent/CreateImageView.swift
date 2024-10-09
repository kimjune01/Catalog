
import SwiftUI

struct CreateImageView: View {

  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Image from bundle").font(.headline)
        Image("bbb-splash")
          .resizable()
          .imageScale(.small)
          .scaledToFit()
          .block()
        Text("`resizable` is needed for the image to scale").font(.footnote)
        Swifty(code:
        """
        Image("bbb-splash")
          .resizable()
          .imageScale(.small)
          .scaledToFit()
        """
        )
        Divider()

        Text("Image from URL").font(.headline)
        AsyncImage(url: URL(string: "https://peach.blender.org/wp-content/uploads/bbb-splash.png"), content: { image in
          image
            .resizable()
            .scaledToFit()
        }, placeholder: {
          ProgressView()
        })
          .block()
        Swifty(code:
        """
        AsyncImage(url: URL(string: "https://peach.blender.org/wp-content/uploads/bbb-splash.png"), content: { image in
          image
            .resizable()
            .scaledToFit()
        }, placeholder: {
          ProgressView()
        })
        """
        )
        Divider()
      }
      .padding()
    }
  }
}

#Preview {
  CreateImageView()
}
