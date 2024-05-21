import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText : String = ""
    @State  var selectedCategory = ""
    @State var catigoryMenu = ["Starters" , "Mains" , "Desserts" , "Sides"]
    var body: some View {
        VStack {
            VStack {
                Hero()
                Spacer()
                TextField("Search menu", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
                .background(Color.primaryColor1)
                .frame(maxWidth: .infinity, maxHeight: 260)
            HStack {
                Text("ORDER FOR DELIVARY!")
                    .font(.title3.bold())
                    .padding(.top)
                Spacer()
            }.padding(.horizontal)
            HStack {
                ForEach(catigoryMenu, id:\.self){ category in
                    Button {
                        self.selectedCategory = category
                    } label: {
                        Text("\(category)")
                            .font(Font.custom("Karla", size: 16).weight(.medium))
                            .padding()
                            .foregroundColor(.primaryColor1)
                            .bold()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    
                    
                }
            }.padding(.horizontal)
            
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        NavigationLink {
                            DishDetelsView(dish: dish)
                        } label: {
                            HStack {
                                VStack(alignment: .leading){
                                    Text("\(dish.title ?? "")")
                                        .bold()
                                    Text("\(dish.descriptiondeish ?? "no")")
                                        .foregroundStyle(Color.secondary)
                                    Text("$\(dish.price ?? "")")
                                        .foregroundStyle(Color.secondary)
                                }
                                
                                Spacer()
                                if let imageUrlString = dish.image, let imageUrl = URL(string: imageUrlString) {
                                    AsyncImage(url: imageUrl) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                            }
                            .padding()
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets())
                        }

                    }
                }.padding()
                .listStyle(PlainListStyle())
            }
            
        }
        .onAppear {
            getMenuData()
        }
    }

    
    func getMenuData() {
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
                        // Check if the dish already exists in Core Data
                        if !dishExists(title: item.title) {
                            let dish = Dish(context: viewContext)
                            dish.title = item.title
                            dish.price = item.price
                            dish.image = item.image
                            dish.descriptiondeish = item.description
                            dish.category = item.category
                        }
                    }
                    try? viewContext.save()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        dataTask.resume()
    }

    func dishExists(title: String) -> Bool {
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        
        do {
            let matchingDishes = try viewContext.fetch(fetchRequest)
            return !matchingDishes.isEmpty
        } catch {
            print("Error fetching dishes: \(error)")
            return false
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
           return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))]
       }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty{
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}

#Preview {
    Menu()
}
