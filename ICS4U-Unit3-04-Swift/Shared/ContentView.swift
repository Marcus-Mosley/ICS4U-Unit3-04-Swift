//
// ContentView.swift
// ICS4U-Unit3-04-Swift
//
// Created by Marcus A. Mosley on 2021-05-25
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var ndisks: String = ""
    @State private var text: String = ""
    @State private var showingAlert = false

    var body: some View {
        VStack {
            TextField("How many disks would you like in your tower:", text: $ndisks)
                .padding()
            Button("Enter", action: {
                if Int(ndisks) == nil || Int(ndisks)! <= 0 {
                    showingAlert = true
                } else {
                    text = ""
                    solve(Int(ndisks)!, 1, 3)
                }
            }).padding().alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"), message: Text("Not Valid Input"),
                      dismissButton: .default(Text("Got It!")))
            }
            Text("\(text)")
        }
    }

    // Uses recursion to solve the towers of Hanoi problem
    func solve(_ ndisks: Int, _ start: Int, _ end: Int) {

        if ndisks == 1 {
            text += "Move disk 1 from peg \(start) to peg \(end) \n"
        } else {
            solve(ndisks - 1, start, 6 - start - end)
            text += "Move disk \(ndisks) from peg \(start) to peg \(end) \n"
            solve(ndisks - 1, 6 - start - end, end)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
