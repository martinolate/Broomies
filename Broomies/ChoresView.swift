import SwiftUI

struct Chore: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let icon: String
}

struct ChoresView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChoresView(roommates: ["Martín", "Alejo", "Kim"])
        }
    }
}

let allChores: [Chore] = [
    .init(name: "TRASH", icon: "trash_icon"),
    .init(name: "KITCHEN", icon: "kitchen_icon"),
    .init(name: "FRIDGE", icon: "fridge_icon"),
    .init(name: "STAIRS", icon: "stairs_icon"),
    .init(name: "LIVING ROOM", icon: "livingroom_icon"),
    .init(name: "BATHROOM", icon: "bathroom_icon"),
]

struct ChoresView: View {
    let roommates: [String]
    @State private var selected: Set<Chore> = []
    private let columns = [GridItem(.adaptive(minimum: 120), spacing: 20)]

    var body: some View {
        VStack {
            Text("YOUR CHORES")
                .font(.title).bold()
            Text("SELECT ALL THAT APPLY.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.bottom, 16)

            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(allChores) { chore in
                    Button {
                        if selected.contains(chore) {
                            selected.remove(chore)
                        } else {
                            selected.insert(chore)
                        }
                    } label: {
                        VStack {
                            Image(chore.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .padding(12)
                                .background(selected.contains(chore) ? .green.opacity(0.2) : AppColors.tan)
                                .cornerRadius(15)
                            Text(chore.name)
                                .font(.footnote).bold()
                        }
                    }
                }
            }
            .padding(.horizontal, 24)

            Spacer()

            NavigationLink("Assign Tasks") {
                TasksView(roommates: roommates, chores: Array(selected))
            }
            .disabled(selected.isEmpty)
            .buttonStyle(.borderedProminent)
            .padding(.bottom, 32)
        }
        .padding(.top, 40)
        .background(AppColors.tan)
    }
}
