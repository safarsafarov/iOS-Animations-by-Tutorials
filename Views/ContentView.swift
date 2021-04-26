import SwiftUI

struct ContentView : View {
    @State var zoomed = false
    
    
    var body: some View {
        VStack(spacing: 0) {
            HeroImage(name: "hero")
            
            ZStack {
                HStack {
                    TourTitle(title: "Savanna Trek", caption: "15 mile drive followed by an hour long trek")
                        .offset(x: 0, y: -15)
                        .padding(.leading,30)
                        .offset(x: self.zoomed ? 500 : 0, y: -15)
                        .animation(.default)

                    Spacer()
                }
                
                Image("thumb")
                    .clipShape(RoundedRectangle(cornerRadius: self.zoomed ? 40 : 500 ))
                    .overlay(
                        Circle()
                            .fill(self.zoomed ? Color.clear : Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.4))
                            .scaleEffect(0.8)
                    )
                    .position(x: self.zoomed ? 220 : 600, y: 50)
                    .shadow(radius: 10)
                    .animation(.spring())
                    .onTapGesture {
                        self.zoomed.toggle()
                        
                    }
                    .scaleEffect(self.zoomed ? 1.33 : 0.33)
                
                
            }
            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
            
            
            MilestonesList()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
