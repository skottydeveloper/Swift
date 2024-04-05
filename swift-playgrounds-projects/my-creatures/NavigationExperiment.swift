import SwiftUI

struct NavigationExperiment: View {
    var body: some View {
        VStack {
            NavigationStack { 
                List { 
                    Text("NavigationStack Content")
                    
                    NavigationLink("Push Me!") { 
                        Text("I'm the destination View")
                            .navigationTitle("Destination")
                    }
                    
                    NavigationLink("No, Push Me!") { 
                        Text("I'm another destination view")
                            .navigationTitle("Destination")
                    }
                }
            }
        }
    }
}

struct NavigationExperiment_Previews: PreviewProvider {
    static var previews: some View {
        NavigationExperiment().assess()
    }
}
