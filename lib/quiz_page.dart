import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> questions = [
    Question(
      text: "Which of the following is correct about Java 8 lambda expression?",
      answers: [
        "Used to define anonymous methods.",
        "Can access final variables.",
        "Used to implement functional interface.",
        "All of the above"
      ],
      correctAnswerIndex: 3,
    ),
    Question(
      text: "What is Flutter?",
      answers: [
        "A web browser",
        "A mobile app SDK",
        "A database system",
        "A cloud service"
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      text: "Which programming language is used to develop Flutter apps?",
      answers: [
        "Java",
        "Kotlin",
        "Dart",
        "Swift"
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      text: "What is a widget in Flutter?",
      answers: [
        "A hardware component",
        "A type of plugin",
        "A building block of UI",
        "A database table"
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      text: "What is the purpose of the 'setState()' method in Flutter?",
      answers: [
        "To start a new app",
        "To rebuild the widget with new data",
        "To create a new route",
        "To delete a widget"
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      text: "Which method is the entry point of a Flutter app?",
      answers: [
        "main()",
        "startApp()",
        "initApp()",
        "runApp()"
      ],
      correctAnswerIndex: 3,
    ),
    Question(
      text: "Which company developed Flutter?",
      answers: [
        "Apple",
        "Microsoft",
        "Facebook",
        "Google"
      ],
      correctAnswerIndex: 3,
    ),
    Question(
      text: "What is the use of 'pubspec.yaml' file in Flutter?",
      answers: [
        "To write Dart code",
        "To define app's UI",
        "To manage app dependencies",
        "To store user data"
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      text: "Which widget is used for layout in a vertical direction?",
      answers: [
        "Row",
        "Stack",
        "Column",
        "ListView"
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      text: "Which keyword is used to create an immutable variable in Dart?",
      answers: [
        "var",
        "const",
        "final",
        "both const and final"
      ],
      correctAnswerIndex: 3,
    ),
  ];

  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool quizCompleted = false;

  void validateAnswer() {
    if (selectedAnswer == questions[currentQuestion].correctAnswerIndex) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
      });
    } else {
      setState(() {
        quizCompleted = true;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      selectedAnswer = null;
      quizCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quizCompleted) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You scored $score out of ${questions.length}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: restartQuiz,
              child: const Text("Restart Quiz"),
            ),
          ],
        ),
      );
    }

    final question = questions[currentQuestion];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Q${currentQuestion + 1}: ${question.text}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < question.answers.length; i++)
            Card(
              color: selectedAnswer == i
                  ? Colors.deepPurple.withOpacity(0.7)
                  : Colors.white,
              child: ListTile(
                title: Text(
                  question.answers[i],
                  style: TextStyle(
                    color: selectedAnswer == i ? Colors.white : Colors.black,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedAnswer = i;
                  });
                },
              ),
            ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: selectedAnswer == null ? null : validateAnswer,
              child: const Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> answers;
  final int correctAnswerIndex;

  Question({
    required this.text,
    required this.answers,
    required this.correctAnswerIndex,
  });
}
