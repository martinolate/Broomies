# Broomies — Final Report

**Course:** CS345: Software Engineering  
 Martín Olate and Michelle Marchesini  
 Yunting Yin  
**Date:** May 8, 2025

---

## 1. Overview of the Project and Its Intended Users

**Broomies** is an iOS app built with SwiftUI that streamlines how roommates share household chores. Intended users are college housemates (particularly at Earlham College), who want a simple, fair way to:

- Name their “house”  
- List all members (“broomies”)  
- Select common chores  
- Automatically assign tasks in a round-robin pattern  

By guiding users through a clean, step-by-step interface, Broomies reduces conflict and keeps everyone accountable.

---

## 2. Project Deliverables

### 2.1 Major Milestones & Accomplishments
- **Figma Design Complete**: Wireframes and style guide established by April 20.  
- **Welcome & Setup Screens**: LandingPageView, HouseNameView, RoomiesView implemented by April 23.  
- **Chore Selection & Assignment**: ChoresView and TasksView coded by April 30.  
- **Manual Testing & UI Refinement**: Peer feedback loop and bug fixes completed by May 5.

### 2.2 Features Implemented vs. Initial Requirements

| Feature                                      | Planned  | Implemented |
|----------------------------------------------|:--------:|:-----------:|
| Input house name                             | ✅       | ✅          |
| Add/remove roommate names                    | ✅       | ✅          |
| Choose from predefined chore list            | ✅       | ✅          |
| Chore assignment algorithm       | ✅       | ✅          |
| Navigation via `NavigationStack`             | ✅       | ✅          |
| Weekly reminders & notifications             | ✅       | ❌ (deferred)|
| Custom chore creation                        | ✅       | ❌ (deferred)|
| Virtual pet gamification                     | ✅       | ❌ (out of scope) |

### 2.3 Challenges Faced & Resolutions
- **SwiftUI Learning Curve:** Input field behaviors and dynamic lists required research and trial, resolved by consulting Apple docs and community forums.  
- **Collaboration Constraints:** SwiftUI previews can’t be edited concurrently; we divided screens, merged via Git, and kept Figma as single source.  
- **Time Limits:** Advanced features (notifications, custom chores) were scoped out to ensure core MVP stability.

---

## 3. Implementation Details

**Tech Stack**  
- **Language:** Swift 5.x  
- **UI Framework:** SwiftUI  
- **Design & Assets:** Figma; icons in `Assets.xcassets`  
- **Version Control:** GitHub ([repo link](https://github.com/martinolate/Broomies))

**Architecture**  
- **App Entry:** `BroomiesApp.swift` launches `ContentView` in a `NavigationStack`.  
- **Views & State:**  
  - `HouseNameView` handles `@State var houseName:String`  
  - `RoomiesView` manages `@State var roommates:[String]`  
  - `ChoresView` displays `LazyVGrid` of `Chore` structs, tracking `@State var selected:Set<Chore>`  
  - `TasksView` pairs chores to roommates via index modulo operation  

```swift
struct Chore: Identifiable, Hashable {
  let id = UUID()
  let name: String
  let icon: String
}
```

-**UI Snapshots & Diagrams**  
<img src="./1.png" alt="Figma wireframe of chore selection" width="110"/>  
**Figure 1.** Figma wireframe of chore selection

<img src="./2.png" alt="Screenshot of TasksView assigning chores" width="110"/> 

**Figure 2.** Screenshot of TasksView assigning chores


---

## 4. Testing & Results

### Testing Methodology
- **SwiftUI Previews:** Verified layouts at multiple device sizes.  
- **Manual Testing:** Walk-through of all user flows by team members  
### Key Test Cases & Outcomes
| Test Case                      | Expected Result           | Actual Result           |
|--------------------------------|---------------------------|-------------------------|
| Add/remove roommates           | List updates correctly    | Passed                  |
| Select/deselect chores         | Icon highlight toggles    | Passed                  |
| Navigate through all screens   | No dead-ends              | Passed                  |
| Assign chores evenly           | Round-robin distribution  | Passed                  |
| Empty input disables “Next”    | Button disabled           | Initially failed; fixed by adding `.disabled` modifier until validation passed. |

## 5. Reflection

### 5.1 Goals Met & Planned-but-Missing Features
We delivered a polished MVP that meets core goals: UI flow, chore assignment, and responsiveness.  
**Deferred Features** (out of time): notifications, custom chore creation, and gamification.

### 5.2 What Worked Well
- **Agile Iteration:** Frequent check-ins kept us on schedule.  
- **Figma-First Design:** Avoided major UI rework by coding to specs.

### 5.3 Areas for Improvement
- **Persistence Layer:** Integrate CoreData or UserDefaults for session continuity.  
- **Extensibility:** Expose custom chores and settings UI.  
- **User Engagement:** Add animations and reminder notifications to boost adoption.

---

## References  
- Apple SwiftUI Documentation  
- CS345 Project 2 Final Report Guidelines  
- Figma Design: [https://www.figma.com/design/4M84ti6Hx6clo1iTyvdM6k](https://www.figma.com/design/4M84ti6Hx6clo1iTyvdM6k)  
- GitHub Repository: https://github.com/martinolate/Broomies
