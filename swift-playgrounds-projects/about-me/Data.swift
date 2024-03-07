import Foundation
import SwiftUI

struct Info {
    let image: String
    let name: String
    let story: String
    let hobbies: [String]
    let foods: [String]
    let colors: [Color]
    let funFacts: [String]
}

let information = Info(
    image: "Placeholder",
    name: "My Name",
    story: "Once upon a time in the bustling tech metropolis of Silicon Valley, a quirky developer named Sam decided to embark on a rather ambitious project. Sam, known among friends for a peculiar fondness for apples—not just the fruit, but anything remotely related to Apple Inc.—had an epiphany one crisp autumn morning. Inspired by the latest iOS release and the powerful capabilities of Swift, Sam set out to create an app unlike any other, an app that would revolutionize the way people interacted with their digital assistants.\n\nThe app, whimsically named Siri's Orchard, was designed to bring a touch of humor and whimsy to everyday tasks. With a swift (pun intended) swipe or tap, users could 'plant' digital apple trees, which would grow over time based on the user's productivity. Completing tasks and achieving goals would yield a bountiful harvest, while neglect would result in a rather sullen and fruitless tree.\n\nBut Sam's ingenuity didn't stop there. Leveraging the latest advancements in Swift, the app's core functionality was interspersed with Easter eggs and witty banter, all related to Apple's ecosystem. For instance, asking Siri through the app to perform an impossible task would prompt responses like, 'I'm an assistant, not a magician, but let's see what Swift magic can do!' or 'Even in a parallel universe where I can do that, I'd still need your permission!'\n\nAs the development progressed, Sam encountered the quintessential challenge of all software endeavors: bugs. Not just ordinary bugs, but bugs so peculiar that they seemed to have a sense of humor of their own. One bug caused the digital apple trees to dance whenever a user tried to water them, while another turned the app's UI into a vintage Macintosh interface from the 1980s. Instead of frustration, these bugs brought laughter and a reminder of the joy found in creativity and problem-solving.\n\nAfter months of coding, debugging, and more than a few cups of coffee with apple motifs, 'Siri's Orchard' was ready for launch. The app quickly became a hit, celebrated not only for its innovative use of Swift and integration with iOS but also for its charm and wit. Users loved the playful interaction with Siri and the subtle nods to Apple's history and culture embedded throughout the app.\n\nSam's project was a testament to the power of imagination, the versatility of Swift, and the enduring influence of Apple on technology and culture. 'Siri's Orchard' didn't just make users more productive; it made them smile, proving that even in the realm of technology, a touch of humor and a dash of whimsy could make all the difference. And so, in the heart of Silicon Valley, amidst lines of code and digital apple trees, Sam's creation stood as a whimsical bridge between technology and joy, reminding everyone that sometimes, the most innovative ideas come wrapped in laughter and tied with a Swift bow.",
    hobbies: ["bicycle", "ticket.fill", "book.fill"],
    foods: ["🥐", "🌮", "🍣"],
    colors: [Color.blue, Color.purple, Color.pink],
    funFacts: [
        "The femur is the longest and largest bone in the human body.",
        "The moon is 238,900 miles away.",
        "Prince’s last name was Nelson.",
        "503 new species were discovered in 2020.",
        "Ice is 9 percent less dense than liquid water.",
        "You can spell every number up to 1,000 without using the letter A.\n\n...one, two, three, four...ninety-nine...nine hundred ninety-nine 🧐",
        "A collection of hippos is called a bloat.",
        "White sand beaches are made of parrotfish poop.",
    ]
)
