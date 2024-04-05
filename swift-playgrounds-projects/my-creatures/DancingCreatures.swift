import SwiftUI
import Guide

struct DancingCreatures: View {
    @EnvironmentObject var data : CreatureZoo
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(data.creatures) { creature in
                    Text(creature.emoji)
                        .resizableFont()
                        .offset(creature.offset)
                        .rotationEffect(creature.rotation)
                        // .animation(.spring(response: 0.5, dampingFraction: 0.5), value: creature.rotation)
                        .animation(.default.delay(data.indexFor(creature) / 10), value: creature.offset)
                }
            }
            .onTapGesture {
                data.randomizeOffsets()
            }                
        }
    }
}

struct DancingCreatures_Previews: PreviewProvider {
    static var previews: some View {
        DancingCreatures().environmentObject(CreatureZoo())
    }
}
