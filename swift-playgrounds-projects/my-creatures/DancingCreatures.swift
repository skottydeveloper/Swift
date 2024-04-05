import SwiftUI
import Guide

struct DancingCreatures: View {
    @EnvironmentObject var data : CreatureZoo
    
    var body: some View {
        SPCAssessableGroup(view: self) {
            VStack {
                ZStack {
                    /*#-code-walkthrough(dance.forEach)*/
                    ForEach(data.creatures) { creature in
                        /*#-code-walkthrough(dance.forEach)*/
                        /*#-code-walkthrough(dance.textView)*/
                        Text(creature.emoji)
                            .resizableFont()
                            .offset(creature.offset)
                            .rotationEffect(creature.rotation)
                         // .animation(.spring(response: 0.5, dampingFraction: 0.5), value: creature.rotation)
                        /*#-code-walkthrough(dance.textView)*/
                            .animation(.default.delay(data.indexFor(creature) / 10), value: creature.offset)
                        //#-learning-code-snippet(animationSolution)
                    }
                }
                /*#-code-walkthrough(dance.onTap)*/
                .onTapGesture {
                    data.randomizeOffsets()
                }
                /*#-code-walkthrough(dance.onTap)*/
                
            }
        }
    }
}

struct DancingCreatures_Previews: PreviewProvider {
    static var previews: some View {
        DancingCreatures().environmentObject(CreatureZoo())
    }
}
