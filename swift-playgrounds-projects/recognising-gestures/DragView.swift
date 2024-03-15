import SwiftUI

struct DragView: View {
    private let circleSize: CGFloat = 100

    @State private var offset = CGSize.zero
    @State private var scale = 1.0

    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                offset = CGSize(width: value.startLocation.x + value.translation.width - circleSize/2,
                                height: value.startLocation.y + value.translation.height - circleSize/2)
                withAnimation { 
                    scale = 1.5
                }
            }
            .onEnded { value in
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) { 
                    scale = 1
                }
            }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .foregroundColor(.teal)
                .frame(width: circleSize * scale, height: circleSize * scale)
                .offset(offset)
                .gesture(dragGesture)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .top) {
            Text("Use one finger to drag the circle around")
                .padding()
        }
        .navigationTitle("Drag")
        .toolbar {
            Button("Reset") {
                offset = .zero
            }
        }
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
