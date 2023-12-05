//
//  EmployeeView.swift
//  NavigationSplitView
//
//  Created by Tim Mitra on 12/5/23.
//

import SwiftUI

struct EmployeeView: View {
    @EnvironmentObject var store: DataStore
    var employeeId: Employee.ID? // receive the employee
    
    var body: some View {
        if let employeeId {
            if let employee = store.employee(id: employeeId) {
                VStack {
                    Text(employee.company.name)
                        .font(.largeTitle)
                    Text(employee.fullName)
                        .font(.title)
                    Text("\"" + employee.slogan + "\"")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .italic()
                        .padding()
                    Grid {
                        GridRow(alignment: .top) {
                            Text("Department:").bold()
                                .gridColumnAlignment(.trailing)
                            Text(employee.department)
                                .gridColumnAlignment(.leading)
                        }
                        GridRow(alignment: .top) {
                            Text("Title:").bold()
                            Text(employee.title)
                                // alignments inherited
                        }
                    }
                    .padding()
                    .border(.primary)
                    .font(.title3)
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        } else {
            VStack {
                Image("employee")
                    .resizable()
                    .scaledToFit()
                .frame(width: 300)
                Text("Select Employee")
                    .font(.title)
            }
        }
    }
}

#Preview {
    EmployeeView(employeeId: "80bee40f-0ff7-4c56-a70d-002fa36726ae")
        .environmentObject(DataStore())
}
