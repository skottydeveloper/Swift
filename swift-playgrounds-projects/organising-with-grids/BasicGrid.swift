import SwiftUI

struct BasicGrid: View {
    var body: some View {
        /*#-code-walkthrough(basicGrid)*/
        Grid(alignment: .top, horizontalSpacing: 10, verticalSpacing: 10) {
            /*#-code-walkthrough(basicGrid)*/
            GridRow {
                Color.red
                Color.orange
                Color.pink
                    .gridCellColumns(2)
            }
            GridRow(alignment: .center) {
                Text("UNITED COLORS")
                    .gridCellAnchor(.center)
                Color.purple
                Color.blue
                    .gridCellColumns(2)
            }
            GridRow(alignment: .center) {
                Color.yellow
                Text("OF BENETTON")
                    .gridCellAnchor(.center)
                Color.green
                    .gridCellColumns(2)
            }
        }
    }
}

struct BasicGrid_Previews: PreviewProvider {
    static var previews: some View {
        BasicGrid()
    }
}

