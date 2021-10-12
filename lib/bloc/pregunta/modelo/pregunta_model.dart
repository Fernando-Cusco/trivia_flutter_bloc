// To parse this JSON data, do
//
//     final pregunta = preguntaFromJson(jsonString);

import 'dart:convert';

Pregunta preguntaFromJson(String str) => Pregunta.fromJson(json.decode(str));

String preguntaToJson(Pregunta data) => json.encode(data.toJson());

class Pregunta {
    Pregunta({
        this.category,
        this.type,
        this.difficulty,
        this.question,
        this.correctAnswer,
        this.incorrectAnswers,
    });

    String category;
    String type;
    String difficulty;
    String question;
    String correctAnswer;
    List<String> incorrectAnswers;

    factory Pregunta.fromJson(Map<String, dynamic> json) => Pregunta(
        category: json["category"],
        type: json["type"],
        difficulty: json["difficulty"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "type": type,
        "difficulty": difficulty,
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
    };
}
