import Foundation

class MikroViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isLoading = false
    @Published var error: String?
    @Published var stoklar: [StokModel] = []
    
    private let apiService = APIService.shared
    
    func login(username: String, password: String) async {
        DispatchQueue.main.async {
            self.isLoading = true
            self.error = nil
        }
        
        do {
            let response = try await apiService.login(username: username, password: password)
            DispatchQueue.main.async {
                self.isLoggedIn = true
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.error = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    func getStokList() async {
        DispatchQueue.main.async {
            self.isLoading = true
            self.error = nil
        }
        
        // Stok listesi çekme işlemi burada implement edilecek
        
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
    
    func yeniStokEkle(stokKodu: String, stokAdi: String) async {
        DispatchQueue.main.async {
            self.isLoading = true
            self.error = nil
        }
        
        // Yeni stok ekleme işlemi burada implement edilecek
        
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}
