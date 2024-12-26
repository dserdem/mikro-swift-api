import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MikroViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Login Bölümü
                if !viewModel.isLoggedIn {
                    LoginView(viewModel: viewModel)
                } else {
                    // Ana Menü
                    List {
                        NavigationLink("Stok Listesi", destination: StokListView(viewModel: viewModel))
                        NavigationLink("Yeni Stok Ekle", destination: YeniStokView(viewModel: viewModel))
                    }
                    .navigationTitle("Mikro Menü")
                }
            }
        }
    }
}
