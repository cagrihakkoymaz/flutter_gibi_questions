import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary.dart';

class ResulstScreen extends StatelessWidget {
  const ResulstScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    final numTotalQuestion=questions.length;
    final numCorrectQuestion=summaryData.where((data){
      return data['user_answer']==data['correct_answer'];
    } ).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dogru bilinen Soru : $numCorrectQuestion Toplam Soru: $numTotalQuestion'),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {},
                child: Text('Restart Quiz'),
              )
            ],
          ),
        ));
  }
}
