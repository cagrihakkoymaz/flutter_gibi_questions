import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummeryItem extends StatelessWidget {
  const SummeryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            itemData['question'] as String,
            style: GoogleFonts.lato(
              color: Colors.amber,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(itemData['user_answer'] as String,
              style: const TextStyle(
                color: Color.fromARGB(255, 92, 94, 218),
              )),
          Text(itemData['correct_answer'] as String,
              style: const TextStyle(
                color: Color.fromARGB(255, 121, 227, 119),
              )),
        ]))
      ],
    );
  }
}
