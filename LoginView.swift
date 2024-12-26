import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: MikroViewModel
    @State private var firmaKodu: String = "FAUNA2025"
    @State private var kullaniciKodu: String = "SRV"
    @State private var sifre: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Mikro Login")
                .font(.title)
            
            TextField("Firma Kodu", text: $firmaKodu)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Kullanıcı Kodu", text: $kullaniciKodu)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("Şifre", text: $sifre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Giriş Yap") {
                Task {
                    await viewModel.login(username: kullaniciKodu, password: sifre)
                }
            }
            .buttonStyle(.borderedProminent)
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
