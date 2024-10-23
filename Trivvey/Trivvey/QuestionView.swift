//
//  QuestionView.swift
//  Trivvey
//
//  Created by Natalie Ammerman on 10/22/24.
//

import SwiftUI

struct QuestionView: View {
    let question: Question
    
    @State private var selectedAnswer: String?
    
    var body: some View {
        VStack {
            Text(question.question).font(.title)
            VStack {
                Button("\(question.A)") {
                    selectedAnswer = "A"
                }
                Button("\(question.B)") {
                    selectedAnswer = "B"
                }
                Button("\(question.C)") {
                    selectedAnswer = "C"
                }
                Button("\(question.D)") {
                    selectedAnswer = "D"
                }
            }
            .buttonStyle(.borderedProminent)
            
            if let selectedAnswer = selectedAnswer {
                if selectedAnswer == question.answer {
                    Text("Correct!").foregroundColor(.green).bold()
                }
                else {
                    Text("Incorrect!").foregroundColor(.red).bold()
                }
            }
        }
    }
}

#Preview {
    QuestionView(question: Question.example)
}
