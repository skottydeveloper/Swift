import SwiftUI

struct BasicAnimationView: View {
    @State private var isScaled = false
    @State private var isCircleShowing = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.indigo)
                .frame(maxHeight: 200)
                .scaleEffect(isScaled ? 1 : 0.5)
                .onTapGesture {
                    withAnimation(.easeInOut) { 
                        isScaled.toggle()
                        isCircleShowing.toggle()
                    }
                }
            if isCircleShowing { 
                Circle()
                    .frame(maxHeight: 200)
                    .foregroundColor(.mint)
                    .transition(.slide)
            }
        }
        .padding()
    }
}

struct BasicAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimationView()
    }
}
