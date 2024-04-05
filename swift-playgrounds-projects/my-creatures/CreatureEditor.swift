import SwiftUI
import Guide

struct CreatureEditor: View {
    //#-learning-code-snippet(defineVariablesCreatureEditor)
    @Environment(\.dismiss) var dismiss
    @State var newCreature : Creature = Creature(name: "", emoji: "")
    @EnvironmentObject var data : CreatureZoo
    
    var body: some View {
        SPCAssessableGroup(view: self) {
            VStack(alignment: .leading) {
                Form {
                    Section("Name") {
                        //#-learning-code-snippet(addACreatureEditorTextField)
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
            //#-learning-code-snippet(addButtonToToolbar)
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

