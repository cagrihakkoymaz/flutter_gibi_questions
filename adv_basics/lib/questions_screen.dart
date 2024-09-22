import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  bool showImageFlag = false; // Flag to control image visibility
  String currentImagePath = ''; // Variable to store the current image path

  Widget showImage(String imagePath) {
    return GestureDetector( // Use GestureDetector to handle tap
      onTap: () {
        setState(() {
          showImageFlag = false; // Hide the image immediately on tap
          currentQuestionIndex++; // Move to the next question
        });
      },
      child: Container(

        child: Image.asset(
          imagePath,
          fit: BoxFit.cover, // Fit the image to cover the entire container
        ),
      ),
    );
  }

  void answerQuestion(String selectedAnswer, String imagePath) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentImagePath = imagePath; // Set the current image path
      showImageFlag = true; // Show the image
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showImageFlag)
              showImage(currentImagePath) // Show the image when the flag is true
            else ...[
              Text(
                currentQuestion.text,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 45),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer, currentQuestion.imagePath);
                  },
                );
              }),
            ],
          ],
        ),
      ),
    );
  }
}
