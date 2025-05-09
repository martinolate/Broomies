import SwiftUI

struct RoomiesView: View {
    var houseName: String
    @State private var roommates: [String] = ["", ""]

    var body: some View {
        VStack(spacing: 16) {
            Text("WHO ARE THE BROOMIES?")
                .font(.title2).bold()

            ForEach(roommates.indices, id: \.self) { i in
                HStack {
                    Image("bubbles")
                        .resizable()
                        .frame(width: 80, height: 80)

                    TextField("Name", text: Binding(
                        get: { roommates[i] },
                        set: { roommates[i] = $0 }
                    ))
                    .textFieldStyle(.roundedBorder)

                    Button {
                        roommates.remove(at: i)
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
                .padding(.horizontal, 24)
            }

            Button {
                roommates.append("")
            } label: {
                Label("Add Brooomie", systemImage: "plus")
            }
            .padding(.top, 8)

            Spacer()

            NavigationLink("Next") {
                ChoresView(roommates: roommates.filter { !$0.isEmpty }.shuffled())
            }
            .disabled(roommates.allSatisfy { $0.isEmpty })
            .buttonStyle(.borderedProminent)
        }
        .padding(.top, 40)
        .background(AppColors.tan)
    }
}

struct RoomiesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomiesView(houseName: "Latinx House")
        }
    }
}
