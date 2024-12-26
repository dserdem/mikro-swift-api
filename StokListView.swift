import SwiftUI

struct StokListView: View {
    @ObservedObject var viewModel: MikroViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.stoklar, id: \.stokKodu) { stok in
                VStack(alignment: .leading) {
                    Text(stok.stokKodu)
                        .font(.headline)
                    Text(stok.stokAdi)
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle("Stok Listesi")
        .onAppear {
            Task {
                await viewModel.getStokList()
            }
        }
        
        if viewModel.isLoading {
            ProgressView()
        }
    }
}
