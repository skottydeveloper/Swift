import SwiftUI


struct DedicationView: View {
    var dedication : String
    var body: some View {
            Text(dedication)
            .font(.system(size: 13, weight: .regular, design: .serif))
            .foregroundColor(.black)
            .italic()
            .multilineTextAlignment(.center)
            .padding(.horizontal, 30)
            .padding(.vertical, 120)
    }
}
