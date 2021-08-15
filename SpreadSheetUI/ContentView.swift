//
//  ContentView.swift
//  SpreadSheetUI
//
//  Created by Leo Dion on 8/14/21.
//

import SwiftUI

struct Item : Identifiable {
  let id : UUID
  var name : String
  var priority: Int
  var dueDate : Date?
}
class DataObject : ObservableObject {
  @Published var items : [Item] = (1...100).map{
    Item(id: UUID(),name: $0.description, priority: 100 - $0,  dueDate: Bool.random() ? nil : Date(timeIntervalSinceNow: .random(in: 0...3600)))
  }
}

struct ContentView: View {
  
    let formatter = Date.FormatStyle(date: .numeric, time: .omitted)
  
  @State var data = DataObject()
    var body: some View {
      List{
        ForEach(self.data.items.indices) { index in
          HStack{
              TextField("Task Name", text: self.$data.items[index].name)
            TextField("Priority", value: self.$data.items[index].priority,
                      format: .number )
            TextField("Due Date", value: self.$data.items[index].dueDate, format: self.formatter)
          }
      }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
