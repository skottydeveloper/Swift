import SwiftUI

struct CoverPage: Story {
    var myStory: some Prose {
        ChoicePage {
            Picture(.astronautOopsy)
            Title("Marooned on Mirage: An Astronaut's Odyssey")
            Choice(title: "Begin Your Story", destination: 1)
        }
    }
}

struct PageOne: Story {
    var myStory: some Prose {
        ChoicePage {
            Picture(.astronautOopsy)
            "Captain Elara Sterling's mission took an unexpected turn when a cosmic storm caused her spacecraft, the Odyssey Explorer, to crash on an uncharted planet. Waking from the impact, Elara found herself in a world unlike any other, with glittering landscapes and ethereal light."
            
            PageBreak()
            
            "Despite the crash, she ventured out, driven by a mix of scientific curiosity and the stark reality of survival. The planet was a surreal blend of beauty and strangeness, with silver and gold foliage, rivers of liquid light, and iridescent fauna. It was a place that defied explanation, challenging her understanding of the natural world."
            
            PageBreak()
            
            "Isolated and with limited supplies, Elara was forced to adapt. She learned to live off the land, discovering edible fruits and healing waters. The planet, which she named Mirage, became both her sanctuary and her prison. Over time, Elara's initial desperation transformed into a profound connection with Mirage. She grew to see it not as her captor, but as her home, a testament to her resilience and adaptability."
            
            PageBreak()
            
            "As days turned into months, Elara realised that rescue might never come. Yet, she found peace in her new life, embracing the unknown with open arms. Mirage, with all its mysteries and beauty, had shown her the infinite possibilities of the cosmos, forging an unbreakable bond between a stranded astronaut and her new world."
            
            Choice(title: "Path to the Crystal Caverns", destination: 2)
            Choice(title: "Voyage Across the Silver Canopies", destination: 3)
        }
    }
}

struct PageTwo: Story {
    var myStory: some Prose {
        ChoicePage {
            Picture(.treasure)
            
            "Elara stumbled upon an entrance to the Crystal Caverns while exploring the base of a gargantuan, silver-leafed tree. The cavern entrance, veiled by the tree's massive roots, pulsed with a soft, inviting glow. With a mix of trepidation and exhilaration, Elara decided to delve into the depths of Mirage, hoping to uncover more about the planet's mysteries or perhaps find a clue to aid her survival."
            
            PageBreak()
            
            "The caverns were a labyrinth of iridescent tunnels, walls lined with crystals that illuminated the path with a spectrum of colors. As she ventured deeper, the air thrummed with an unexplained energy, and the crystals seemed to react to her presence, glowing brighter with each step. Elara discovered remnants of an ancient civilisation: artifacts and technology harmoniously integrated with the natural elements of the cavern."
            
            PageBreak()
            
            "In the heart of the caverns, she found a chamber with a crystal dais, housing a device that, when activated, projected a map of the galaxy, highlighting trade routes and unknown civilisations. It was a beacon, she realised, possibly her key to contacting others or even finding a way off Mirage. But activating the beacon would deplete her energy supplies, leaving her vulnerable in the depths of the planet."
            
            Choice(title: "Activation of the Ancient Beacon", destination: 4)
        }
    }
}

struct PageThree: Story {
    var myStory: some Prose {
        ChoicePage {
            Picture(.wizardLibrary)
            
            "Choosing to explore the vast forests of Mirage, Elara ventured into the realm of the silver canopies, where the ground rarely saw the light of day. The trees, towering and majestic, seemed to communicate through whispers carried by the wind, guiding her path and warning her of dangers."
            
            PageBreak()
            
            "As she journeyed, Elara encountered the flora and fauna of Mirage, each creature more wondrous and bizarre than the last. She met a flock of luminescent birds that sang in harmonies so complex, they unlocked memories and dreams. She stumbled upon a clearing where the trees bore fruit that could heal or harm based on the eater's intentions."
            
            PageBreak()
            
            "The climax of her journey was reaching the Elder Grove, a sacred place where the oldest trees of Mirage converged. Here, she learned the truth of the planet's sentience, its history intertwined with the cosmos. The Elder Grove offered her a choice: to bond with the planet, gaining knowledge and abilities that would ensure her survival and possibly a way to signal for rescue, but at the cost of never being able to leave Mirage."
            
            PageBreak()
            
            "Both paths presented Elara with unprecedented discoveries and decisions. Whether delving into the ancient secrets of the Crystal Caverns or bonding with the sentient life of the silver canopies, her journey on Mirage was a testament to the endless possibilities that lay beyond the stars, highlighting the resilience and adaptability of the human spirit in the face of the unknown."
            
            Choice(title: "Bonding with the Planet", destination: 5)
        }
    }
}

struct PageFour: Story {
    var myStory: some Prose {
        ChoicePage {
            Title("END")
            
            "After much deliberation, Elara decided to activate the ancient beacon within the Crystal Caverns, despite the risk of depleting her limited energy supplies. As the device came to life, it emitted a powerful pulse of light that surged through the caverns, illuminating the crystals in a dazzling display of colors. The beacon's signal pierced the cosmos, reaching unknown civilisations and cutting through the silence of space."
            
            PageBreak()
            
            "Weeks passed with no sign of a response, and Elara's supplies dwindled dangerously low. Just as hope began to fade, a fleet of ships from a coalition of advanced civilisations appeared in orbit around Mirage. They had received the beacon's call—a distress signal and a marker of discovery. Elara was rescued, and in return for her bravery and the wealth of information she provided about Mirage, she was offered a place among the coalition's explorers."
            
            PageBreak()
            
            "The decision to activate the beacon not only saved her life but also opened a new chapter of interstellar cooperation and discovery. Mirage became a hub of cultural exchange and scientific exploration, with Elara as one of its first ambassadors. Her legacy was one of courage, curiosity, and the unyielding desire to reach out across the vastness of space to find connection and understanding."
        }
    }
}

struct PageFive: Story {
    var myStory: some Prose {
        ChoicePage {
            Title("END")
            
            "In the heart of the Elder Grove, surrounded by the ancient sentinels of Mirage, Elara chose to bond with the planet. The process was mystical, a connection forged in the depths of her consciousness, intertwining her essence with that of Mirage. She felt her mind expand, her senses sharpen, and her understanding of the planet deepen beyond imagination."
            
            PageBreak()
            
            "This bond granted her the ability to communicate with the flora and fauna of Mirage, to understand their needs and desires. She learned to harness the energies of the planet, healing the scars left by the crash and thriving in a symbiosis that brought balance to her and the world around her."
            
            PageBreak()
            
            "Elara became a guardian of Mirage, ensuring that its beauty and secrets would be preserved for the generations to come. When explorers from distant worlds eventually arrived, drawn by the tales of a lone astronaut who had become one with a planet, they found not just Elara but a thriving ecosystem rich with possibilities for peaceful exchange and mutual growth."
            
            PageBreak()
            
            "Elara's story became a legend, a tale of transcendence and unity that inspired countless others to seek understanding and harmony with the universe. Her choice to bond with Mirage was not the end of her journey but the beginning of a new era of exploration, where humanity and alien worlds could coexist and learn from one another in a shared odyssey of discovery."
        }
    }
}

struct MyAdventureBook: StoryBook {
    var author = "Author"
    var title = "Choose Your Own Story"
    var stories: some Stories {
        CoverPage() // 0
        PageOne() // 1
        PageTwo() // 2
        PageThree() // 3
        PageFour() // 4
        PageFive() // 5
    }
}

struct MyAdventureStory_Previews : PreviewProvider {
    static var previews: some View {
        MyAdventureStoryView()
            .storyNodeBackgroundStyle()
    }
}
