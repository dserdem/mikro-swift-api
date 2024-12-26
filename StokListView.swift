import SwiftUI

struct YeniStokView: View {
    @ObservedObject var viewModel: MikroViewModel
    @State private var stokKodu: String = ""
    @State private var stokAdi: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Stok Bilgileri")) {
                TextField("Stok Kodu", text: $stokKodu)
                TextField("Stok Adı", text: $stokAdi)
            }
            
            Button("Kaydet") {
                Task {
                    await viewModel.yeniStokEkle(stokKodu: stokKodu, stokAdi: stokAdi)
                }
            }
            .disabled(stokKodu.isEmpty || stokAdi.isEmpty)
        }
        .navigationTitle("Yeni Stok")
        
        if viewModel.isLoading {
            ProgressView()
        }
    }
}
