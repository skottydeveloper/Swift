import SwiftUI

enum CoverImage: CaseIterable {
    case dragon
    case scifi
    case sword
    case fantasy
}

struct BookTitle {
    var title: String
    var author: String
    var image: CoverImage
}

struct BookCoverView: View {
    var author: String
    var titleCover: String
    var coverImage: CoverImage
    var body: some View {
        Group {
            VStack {
                ZStack {
                    Image("\(coverImage)")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    VStack {
                        /*if coverImage != .fantasy {
                            Spacer()
                        }*/
                        Text(titleCover)
                            .foregroundColor(Color("pale-yellow"))
                            .font(.system(size: 25, weight: .bold, design: .serif))
                            .frame(maxWidth: 200)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 30)
                        Text(author)
                            .padding(.top, 5)
                            .foregroundColor(Color("pale-yellow"))
                            .font(.system(size: 15, weight: .bold, design: .serif))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 30)
                    }
                }
            }
            .padding(.top)
        }
       
    }
}
