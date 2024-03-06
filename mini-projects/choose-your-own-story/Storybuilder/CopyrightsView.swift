import SwiftUI

struct CopyrightsView: View {
    @State var author: String
    var currentYear: String {
        guard let year = Calendar(identifier: .gregorian).dateComponents([.year], from: .now).year else { return "Unknown Year"}
        return String(year)
    }
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Copyright © \(currentYear) \(author)")
                    .font(.system(size: 13, weight: .regular, design: .serif))
                    .foregroundColor(.black)
            }.padding(.vertical)
            Text("All rights reserved. No part of this book may be reproduced or used in any manner without the prior written permission of the copyright owner, except for the use of brief quotations in a book review.")
                .font(.system(size: 13, weight: .regular, design: .serif))
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.top, 75)
        .padding(.horizontal, 30)

    }
}
