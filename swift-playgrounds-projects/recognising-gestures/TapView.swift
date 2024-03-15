import SwiftUI

struct TapView: View {
    @State private var isScaled = false
    @State private var color : Color = Color.primary

    var tapGesture: some Gesture {
        TapGesture(count: 2)
            .onEnded {
                withAnimation {
                    color = Color.random()
                    isScaled.toggle()
                }
            }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .foregroundColor(color)
                .frame(width: 250, height: 350)
                .gesture(tapGesture)
                .scaleEffect(isScaled ? 1 : 0.25)
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
                .onTapGesture { 
                    color = Color.purple
                }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.top)
        .overlay(alignment: .top) {
            Text("Tap the rectangle to change its color")
                .padding()
        }
        .navigationTitle("Tap")
        .toolbar {
            Button("Reset") {
                color = Color.primary
            }
        }
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
