import SwiftUI

struct SleepViewHalf: View {
    @Binding var value: Double
    var isEditing: Bool
    var fontStyle: JournalFont

    var body: some View {
        VStack {
            Text(isEditing ? "How many hours did you sleep?" : "Hours Slept")
                .foregroundColor(.darkBrown)
                .font(fontStyle.uiFont(15))
                .frame(maxWidth: .infinity, alignment: isEditing ? .leading : .center)
            
            Spacer()
            
            Text("\(Int(value))")
                .foregroundColor(.darkBrown)
                .modifier(FontStyle(size: 50))
            
            Spacer()
            
            if isEditing {
                Stepper("Hours Slept", value: $value, in: 0...12, step: 1)
                    .labelsHidden()
            }
        }
        .frame(minHeight: 100, maxHeight: 200)
        .padding()
    }
}

struct SleepViewHalf_Previews : PreviewProvider {
    static var previews: some View {
        SleepViewHalfPreview()
    }
}
