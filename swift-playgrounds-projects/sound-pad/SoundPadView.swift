import SwiftUI

struct SoundPadView: View {
    var body: some View {
        Beats {
            LoopButton(beat: .CosmicBeat, color: .teal).speed(1.5).filter(.drumsBitBrush)
            LoopButton(beat: .HotBeat1, color: .cyan).speed(1.2)
            LoopButton(beat: .GlowBeat, color: .mint).speed(1.4)
            LoopButton(beat: .DiscoBeat1, color: .orange).speed(1.7)
            LoopButton(beat: .FeverBeat, color: .yellow).speed(1.4)
            LoopButton(beat: .SolarisBeat2, color: .red).speed(1.6)
            LoopButton(beat: .GoTimeBeat2, color: .pink).speed(1.5)
        }
        Bass {
            LoopButton(bass: .CosmicBass, color: .pink).speed(0.5).filter(.multiEcho1)
            LoopButton(bass: .PrismaticaBass7, color: .blue).speed(0.5)
            LoopButton(bass: .DreamsBass1, color: .green).speed(0.5).filter(.drumsLoFi)
            LoopButton(bass: .ParisNightsBass, color: .red).speed(0.5)
            LoopButton(bass: .LesInfernoBass, color: .purple).speed(0.5)
            LoopButton(bass: .SaintTropezBass, color: .teal).speed(0.5)
            LoopButton(bass: .PrismaticaBass7, color: .yellow).speed(0.5).filter(.multiDecimated1)
        }
        Melodic {
            LoopButton(melodic: .DreamsChords3, color: .teal).volume(0.5)
            LoopButton(melodic: .ParisArpeggio, color: .indigo).volume(0.5)
            LoopButton(melodic: .GlowChords, color: .orange).volume(0.5)
            LoopButton(melodic: .PrismaticaChords2, color: .cyan).volume(0.5)
        }
        Ambient {
            LoopButton(ambient: .DiscoSynth1, color: .red).volume(0.5)
            LoopButton(ambient: .PrismaticaSynth2, color: .yellow).volume(0.7)      
            LoopButton(ambient: .SolarisString, color: .orange).volume(0.5)      
            LoopButton(ambient: .GlitterSynth, color: .pink).volume(0.5)
        }
        SoundFX {
            SoundFXButton(sound: .PlanetariumFX3, color: .green).pitch(.E)
            SoundFXButton(sound: .FirstGearFX, color: .teal).pitch(.E)
            SoundFXButton(sound: .HornBassFX, color: .orange).pitch(.E)
            SoundFXButton(sound: .BotTalkFX3, color: .mint).pitch(.E)
            SoundFXButton(sound: .KazooFX4, color: .indigo).pitch(.E)
            SoundFXButton(sound: .TromboneFX1, color: .green).pitch(.E)
        }
    }
}
