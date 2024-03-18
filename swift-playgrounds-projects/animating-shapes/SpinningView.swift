import SwiftUI
//#-learning-task(spinningAnimation)

struct ResetEllipse: View {
    var body: some View {
        Ellipse()
            .frame(width: 200, height: 200)
            .foregroundColor(.orange)
    }
}
struct SpinningEllipse: View {
    /*#-code-walkthrough(2.spinningAnimation)*/
        @State private var width: CGFloat = 200
    /*#-code-walkthrough(2.spinningAnimation)*/

        var body: some View {
            Ellipse()
                .frame(width: width, height: 200)
                .foregroundColor(.orange)
                .onAppear {
                    /*#-code-walkthrough(3.spinningAnimation)*/
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(2)) {
                    /*#-code-walkthrough(3.spinningAnimation)*/
                        /*#-code-walkthrough(4.spinningAnimation)*/
                        width = 0
                        /*#-code-walkthrough(4.spinningAnimation)*/
                    }
                }
        }
}
/*#-code-walkthrough(1.spinningAnimation)*/
struct SpinningView: View {
/*#-code-walkthrough(1.spinningAnimation)*/
    @State private var isSpinning = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            if isSpinning {
                SpinningEllipse()
            } else {
                ResetEllipse()
            }
            
            Spacer()
            
            PlayResetButton(animating: $isSpinning) 
        }
        .navigationTitle("Spinning Animation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SpinningView_Previews: PreviewProvider {
    static var previews: some View {
        SpinningView()
    }
}


