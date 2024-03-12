import SwiftUI


struct AmazingAlignment: View {
    var body: some View {
        /*#-code-walkthrough(5.alignmentIntro)*/
        VStack {
            /*#-code-walkthrough(5.alignmentIntro)*/
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 40))
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
            
            VStack (alignment: .trailing) {
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 10)
            }
            
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 40))
            /*#-code-walkthrough(5.frameAlignmentExplain)*/
                .frame(maxWidth: .infinity, alignment: .trailing)
            /*#-code-walkthrough(5.frameAlignmentExplain)*/
                .background(Color.yellow)
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
            /*#-code-walkthrough(5.SpacerAlignmentExplain)*/
            /*#-code-walkthrough(5.stackSpacing)*/
            
            HStack (spacing: 20) {
                /*#-code-walkthrough(5.stackSpacing)*/
                Spacer()
                
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                    .background(Color.yellow)
                
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                    .padding(.trailing, 20)
            }
            .background(Color.mint)
            /*#-code-walkthrough(5.SpacerAlignmentExplain)*/
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
        }
        .frame(width: 250)
        .border(Color.black)

    }
}

struct AmazingAlignment_Previews: PreviewProvider {
    static var previews: some View {
        AmazingAlignment()
    }
}
