//
//  ContentView.swift
//  Trivvey
//
//  Created by Alexandra Marum on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var questions = [Question]()
    
    var body: some View {
        NavigationStack {
            List(questions, id: \.question) { question in NavigationLink(question.question, destination: QuestionView(question: question))
            }
            .navigationTitle("Trivvey")
            .onAppear() {
                let url: URL = Bundle.main.url(forResource: "questions", withExtension: "json")!
                let data = try! Data(contentsOf: url)
                questions = try! JSONDecoder().decode([Question].self, from: data)
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        questions.shuffle()
                    } label: {
                        Image(systemName: "shuffle")
                        Text("Shuffle")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
