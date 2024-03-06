import SwiftUI

struct BookProgressBar: View {
    @Binding var currentProgress: Int
    @State var totalPages: Int
    var body: some View {
        ProgressView(value: CGFloat(currentProgress), total: CGFloat(totalPages-1))
            .progressViewStyle(BookProgressStyle())

    }
}


struct BookProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
                .frame(width: 250, height: 1)
            HStack(spacing: 0){
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.black)
                    .frame(width: CGFloat(abs(fractionCompleted) * 250), height: 2)
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 5, height: 5)
            }
        }
        .padding(.bottom, 30)
        .padding(.horizontal)
    }
}
