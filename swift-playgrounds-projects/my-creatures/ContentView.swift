import SwiftUI
import Guide

struct ContentView: View {
    @EnvironmentObject var data : CreatureZoo
    
    var body: some View {
        List {
            Text("ContentView")
            
            Section("Dance") {
                NavigationLink("Make the Creatures Dance") { 
                    DancingCreatures()
                        .navigationTitle("Dancing Creatures")
                }
            }
            
            ForEach(data.creatures) { creature in 
                NavigationLink {
                    CreatureDetail(creature: creature)
                        .navigationTitle(creature.name)
                } label: {
                    CreatureRow(creature: creature)
                }
            }
            .onDelete { indexSet in 
                data.creatures.remove(atOffsets: indexSet)
            }
        }
        .toolbar { 
            ToolbarItem { 
                NavigationLink("Add") { 
                    CreatureEditor()
                        .navigationTitle("Add Creature")
                }
            }
        }
    }
}
