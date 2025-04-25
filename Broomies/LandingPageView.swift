import SwiftUI

struct LandingPageView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("broomies_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 200 )
            Text("BROOMIES")
                .font(.largeTitle).bold()
                .padding(.top, 8)
            Spacer()
            NavigationLink("Get Started") {
                HouseNameView()
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.tan)
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandingPageView()
        }
        .previewDevice("iPhone 14 Pro")
    }
}
