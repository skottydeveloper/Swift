import SwiftUI

struct SleepViewHalf: View {
    @Binding var value: Double
    var isEditing: Bool
    var fontStyle: JournalFont

    var body: some View {
        /*#-code-walkthrough(5.composition)*/
        VStack {
            /*#-code-walkthrough(6.textConditional)*/
            Text(isEditing ? "How many hours did you sleep?" : "Hours Slept")
            /*#-code-walkthrough(6.textConditional)*/
                .foregroundColor(.darkBrown)
                .font(fontStyle.uiFont(15))
                .frame(maxWidth: .infinity, alignment: isEditing ? .leading : .center)
            
            Spacer()
            
            /*#-code-walkthrough(6.SpacerSolution)*/
            Text("\(Int(value))")
                .foregroundColor(.darkBrown)
                .modifier(FontStyle(size: 50))
            /*#-code-walkthrough(6.removePadding)*/
            /*#-code-walkthrough(6.SpacerSolution)*/
            
            Spacer()
            
            if isEditing {
                Stepper("Hours Slept", value: $value, in: 0...12, step: 1)
                    .labelsHidden()
            }
        }
        /*#-code-walkthrough(5.composition)*/
        .frame(minHeight: 100, maxHeight: 200)
        .padding()
    }
}

struct SleepViewHalf_Previews : PreviewProvider {
    static var previews: some View {
        SleepViewHalfPreview()
    }
}
