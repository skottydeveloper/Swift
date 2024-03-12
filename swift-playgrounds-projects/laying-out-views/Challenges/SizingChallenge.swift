import SwiftUI

struct SizingChallengeView: View {
    var body: some View {
        VStack {
            ZStack {
                /*#-code-walkthrough(2.viewSizing)*/
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.paleOrange)
                    .frame(maxWidth: 200, maxHeight: 150)
                //#-learning-code-snippet(3.viewSizing)
                /*#-code-walkthrough(2.viewSizing)*/
                VStack {
                    Text("Roses are red,")
                    Image("Rose")
                        .resizable()
                    //#-learning-code-snippet(5.viewSizingImage)
                        .scaledToFit()
                        .frame(maxWidth: 50)
                        .foregroundColor(.themeRed)
                    //#-learning-code-snippet(7.viewSizingImageFrame)
                    Text("violets are blue, ")

                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.paleOrange)
                    .frame(maxWidth: 200, maxHeight: 150)
                VStack {
                    Text("I just love")
                    Image("Heart")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                        .foregroundColor(.themeRed)
                    //#-learning-code-snippet(5.viewSizing)
                    Text("coding with you!")

                }
            }
        }
        .font(.headline)
        .foregroundColor(.darkBrown)
    }
}

struct SizingChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ViewSizingChallengePreview()
    }
}
