import SwiftUI
import Guide

struct CreatureEditor: View {
    @Environment(\.dismiss) var dismiss
    @State var newCreature : Creature = Creature(name: "", emoji: "")
    @EnvironmentObject var data : CreatureZoo
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section("Name") {
                    TextField("Name", text: $newCreature.name)
                }   
                
                Section("Emoji") {
                    TextField("Emoji", text: $newCreature.emoji)
                }
                
                Section("Creature Preview") {
                    CreatureRow(creature: newCreature)
                }
            }
        }
        .toolbar {
            ToolbarItem { 
                Button("Add") { 
                    data.creatures.append(newCreature)
                    dismiss()
                }
            }
        }
    }
}

struct CreatureEditor_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack() {
            CreatureEditor().environmentObject(CreatureZoo())
        }
    }
}
