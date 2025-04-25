import SwiftUI

struct HouseNameView: View {
    @State private var houseName = ""

    var body: some View {
        VStack(spacing: 30) {
            Image("house_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .padding()
                .background(AppColors.blue)
                .cornerRadius(20)

            Text("WHAT’S YOUR HOUSE NAME?")
                .font(.title2).bold()
                .multilineTextAlignment(.center)

            TextField("Latinx House", text: $houseName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 40)

            Spacer()

            NavigationLink("Next") {
                RoomiesView(houseName: houseName)
            }
            .disabled(houseName.isEmpty)
            .buttonStyle(.borderedProminent)
        }
        .padding(.top, 60)
        .background(AppColors.tan)
    }
}

struct HouseNameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HouseNameView()
        }
    }
}
