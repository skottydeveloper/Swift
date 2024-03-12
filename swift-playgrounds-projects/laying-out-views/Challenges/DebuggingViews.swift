import SwiftUI

struct HalfCard: View {
    var body: some View {
        /*#-code-walkthrough(6.debugCrown)*/
        VStack {
            Spacer()
            
            Image(systemName: "crown.fill")
                .font(.system(size: 80))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        /*#-code-walkthrough(6.debugCrown)*/
        /*#-code-walkthrough(thinkAboutModifiers)*/
        .overlay (alignment: .topLeading) {
            VStack {
                Image(systemName: "crown.fill")
                    .font(.body)
                Text("Q")
                    .font(.largeTitle)
                Image(systemName: "heart.fill")
                    .font(.title)
            }
            .padding()
        }
    }
}

struct DebuggingView: View {
    var body: some View {
        /*#-code-walkthrough(6.halfCardExplain)*/
        VStack {
            HalfCard()
            HalfCard()
                .rotationEffect(.degrees(180))
        }
        /*#-code-walkthrough(6.halfCardExplain)*/
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black)
        )
        .aspectRatio(0.70, contentMode: .fit)
        .foregroundColor(.red)
        .padding()
    }
}

struct DebuggingView_Previews: PreviewProvider {
    static var previews: some View {
        DebuggingView()
    }
}
