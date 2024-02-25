//
//  ToDoListItemView.swift
//  toDoList
//
// 
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
       // .font(.title)
        HStack {
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate) .formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            
            Button{
                viewModel.toggleIsDone(item: item)
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
           
            }
        }
        
    }


#Preview {
    ToDoListItemView(item: .init(id: "123",
                                 title: "Get Milk ",
                                 dueDate: Date().timeIntervalSince1970,
                                 createdDate: Date().timeIntervalSince1970, 
                                 isDone: true))
}
