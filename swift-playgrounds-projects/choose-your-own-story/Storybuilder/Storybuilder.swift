import SwiftUI

protocol Story: Stories {
    associatedtype StoryType: Prose
    @Storybuilder var myStory: Self.StoryType { get }
}

protocol Stories {
    var node: StoryNode { get }
}

extension Story {
    var node: StoryNode {
        return myStory.storyNode
    }
}

protocol Prose {
    var storyNode: StoryNode { get }
}

@resultBuilder
struct Storybuilder {
    static func buildBlock(_ components: Prose...) -> StoryNode {
        let nodes = components.map { item in
            item.storyNode
        }
        return .group(nodes)
    }
}

@resultBuilder
struct Bookbuilder {
    static func buildBlock(_ components: Stories...) -> StoryBookNode {
        var allNodes = [StoryNode]()
        for item in components {
            switch item.node {
            case .group(let nodes):
                allNodes.append(contentsOf: nodes)
            default:
                break
            }
        }
        return StoryBookNode(node: .group(allNodes))
    }
}

