import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        VStack {
            Text("Little Lemon")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Text("Chicago")
                .font(.title2)
                .padding(.top, 10)
            
            Text("Order easily with Little Lemon: browse the menu, customize, pay securely, and track your delivery in real-time.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding([.top, .leading, .trailing], 10)
            
            FetchedObjects(predicate: NSPredicate(value: true), sortDescriptors: []) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            Text("\(dish.title ?? "") - $\(dish.price ?? "")")
                            Spacer()
                            if let imageUrlString = dish.image, let imageUrl = URL(string: imageUrlString) {
                                AsyncImage(url: imageUrl) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            getMenuData()
        }
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            guard let data = data else {
                print("No data returned")
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(MenuItem.self, from: data)
                DispatchQueue.main.async {
                    for item in decodedData.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.price = item.price
                        dish.image = item.image
                    }
                    try? viewContext.save()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        dataTask.resume()
    }
    
}

#Preview {
    Menu()
}
