import SwiftUI

struct StoryNodePresenter<StoryBookType>: View where StoryBookType: StoryBook {
    let node: StoryNode
    let book: StoryBookType
    @State var activeTab = 0
    
    @ViewBuilder func presenter(for aNode: StoryNode) -> some View {
        StoryNodePresenter(node: aNode, book: self.book)
    }
    var body: some View {
        switch node {
        case .group(let nodes):
            let flat = nodes.flattened()
            let hasChoices = flat.contains(where: { node in
                switch node {
                case .choiceGroup(_):
                    return true
                default:
                    return false
                }
            })
            if hasChoices {
                NavigationStack {
                    VStack {
                        presenter(for: flat[0])
                        Spacer()
                    }
                    .background(Color("pale-yellow")
                        .ignoresSafeArea())
                }
                .padding(.vertical)
                .frame(maxWidth: 320)
                .accentColor(Color.black)
            } else {
                //tabview
                VStack {
                    TabView(selection: $activeTab) {
                        ForEach(0..<flat.count, id: \.self) { item in
                            if case .paragraph = flat[item] {
                                VStack {
                                    presenter(for: flat[item])
                                    Spacer()
                                }
                                .padding(.top, 30)
                                .tag(item)
                            } else {
                                VStack {
                                    presenter(for: flat[item])
                                    Spacer()
                                }
                                .tag(item)
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle.page(indexDisplayMode: .never))
                        BookProgressBar(currentProgress: $activeTab, totalPages: flat.count)
                }
                .frame(maxWidth: 320)
            }
    
        case .paragraph(let text):
            StoryTextView(text: text)
        
        case .pageBreak:
            EmptyView()
            
        case .image(let name):
            StoryImageView(name: name)
            
        case .storynum(let number):
            StoryNumberView(storyNumber: number)
            
        case .title(let name):
            StoryTitleNameView(title: name)
            
        case .coverGroup(let nodes):
            VStack {
                ForEach(0..<nodes.count,id: \.self) { item in
                    StoryNodePresenter(node: nodes[item], book: self.book)
                }
           }
        case .dedication(let dedication):
            DedicationView(dedication: dedication)
      
        case .titleGroup(let nodes):
            VStack {
                ForEach(0..<nodes.count, id: \.self) { item in
                    StoryNodePresenter(node: nodes[item], book: self.book)
                }
            }
          .padding(.top, 100)


            
        case .choiceGroup(let nodes):
            ZStack {
                Color("pale-yellow")
                    .ignoresSafeArea()
                VStack {
                    ForEach(0..<nodes.count, id: \.self) { item in
                        StoryNodePresenter(node: nodes[item], book: self.book)
                            .storyNodeBackgroundStyle()
                    }
                    Spacer()
                }
            }
           
        case .storyGroup(let nodes):
            VStack {
                ForEach(0..<nodes.count, id: \.self) { item in
                    StoryNodePresenter(node: nodes[item], book: self.book)
                }
            }
            .padding(.top, 30)


            
        case .choice(let title, let destination):
            let dest = book.node(atIndex: destination)
            ChoiceView(text: title, book: book, destination: dest)
                .padding(.top, 20)
        
            
        case .titleCover(let author, let titleCover, let coverImage):
            BookCoverView(author: author, titleCover: titleCover, coverImage: coverImage)
            
        case .copyrights(let author):
            CopyrightsView(author: author)
        }
    }
}


// MARK: -
extension StoryNode {
    var isPageBreak: Bool {
        switch self {
            case .pageBreak: return true
            default: return false
        }
    }
}

extension Array where Element == StoryNode {
    func flattened() -> [StoryNode] {
        var flat: [StoryNode] = []
        var currentRun = ""
        for item in self {
            switch item {
            case .paragraph(let text):
                currentRun += "\(text)\n\n"
            default:
                if !currentRun.isEmpty {
                    flat.append(.paragraph(currentRun))
                    currentRun = ""
                }
                if !item.isPageBreak {
                    flat.append(item)
                }
                
            }
        }
        if !currentRun.isEmpty {
            flat.append(.paragraph(currentRun))
        }
        return flat
    }
}
