import SwiftUI

struct StoryBookNode: Stories {
    var node: StoryNode
}
enum StoryNode: Prose {
    case paragraph(String)
    case pageBreak
    case image(String)
    case choice(String, Int)
    case storynum(Int)
    case title(String)
    case group([StoryNode])
    case titleGroup([StoryNode])
    case coverGroup([StoryNode])
    case titleCover(String, String, CoverImage)
    case copyrights(String)
    case dedication(String)
    case choiceGroup([StoryNode])
    case storyGroup([StoryNode])
    var storyNode: StoryNode { self }
}


// MARK: - DSL

extension String: Prose {
    var storyNode: StoryNode {
        return .paragraph(self)
    }
}

struct PageBreak: Prose {
    var storyNode: StoryNode {
        return .pageBreak
    }
}

struct Picture: Prose {
    let image: String
    var storyNode: StoryNode {
        return .image(image)
    }
    init(_ image: String) {
        self.image = image
    }
    init(_ builtin: Images) {
        self.init("\(builtin)")
    }
}


struct Choice: Prose {
    let title: String
    let destination: Int
    var storyNode: StoryNode {
        return .choice(title, destination)
    }
}

struct Chapter: Prose {
    let number: Int
    var storyNode: StoryNode {
        return .storynum(number)
    }
}

struct Title: Prose {
    let text: String
    var storyNode: StoryNode {
        return .title(text)
    }
    init(_ name: String) {
        self.text = name
    }
}

struct Dedication: Prose {
    let dedication: String
    var storyNode: StoryNode {
        return .dedication(dedication)
    }
}


struct ChoicePage: Prose {
    private let nodes: [StoryNode]
    var storyNode: StoryNode {
        return .choiceGroup(nodes)
    }
    
    init(@Storybuilder _ completion: () -> StoryNode) {
        switch completion() {
        case .group(let nodes):
            self.nodes = nodes
            
        default:
            fatalError("@Storybuilder always should return a group node")
        }
    }
}

struct StoryPage: Prose {
    private let nodes: [StoryNode]
    var storyNode: StoryNode {
        return .storyGroup(nodes)
    }
    
    init(@Storybuilder _ completion: () -> StoryNode) {
        switch completion() {
        case .group(let nodes):
            self.nodes = nodes
            
        default:
            fatalError("@Storybuilder always should return a group node")
        }
    }
}


struct TitlePage: Prose {
    private let nodes: [StoryNode]
    var storyNode: StoryNode {
        return .titleGroup(nodes)
    }
    
    init(@Storybuilder _ completion: () -> StoryNode) {
        switch completion() {
        case .group(let nodes):
            self.nodes = nodes
            
        default:
            fatalError("@Storybuilder always should return a group node")
        }
    }
}

struct BookCover: Prose {
    let author: String
    let coverTitle: String
    let coverImage: CoverImage
    var storyNode: StoryNode {
        return .titleCover(author, coverTitle, coverImage)
    }
}

struct Copyright: Prose {
    let author: String
    var storyNode: StoryNode {
        return .copyrights(author)
    }
}




