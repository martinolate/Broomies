import SwiftUI

struct TasksView: View {
    let roommates: [String]
    let chores: [Chore]

    var body: some View {
        VStack(spacing: 12) {
            Text("TASK ASSIGNMENTS")
                .font(.title2).bold()

            if roommates.isEmpty || chores.isEmpty {
                Text("No roommates or chores selected.")
            } else {
                List {
                    ForEach(chores.indices, id: \.self) { i in
                        HStack {
                            Image(chores[i].icon)
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(chores[i].name)
                            Spacer()
                            Text(roommates[i % roommates.count])
                                .fontWeight(.semibold)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .background(AppColors.tan)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(
            roommates: ["Martín", "Alejo", "Kim"].shuffled(),
            chores: [
                Chore(name: "Dishes", icon: "dishes_icon"),
                Chore(name: "Trash", icon: "trash_icon"),
                Chore(name: "Vacuum", icon: "vacuum_icon")
            ]
        )
    }
}
