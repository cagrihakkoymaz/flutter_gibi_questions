class QuizQuestion {
  const QuizQuestion(this.text, this.answers,this.imagePath);

  final String text;
  final List<String> answers;
  final String imagePath;
  List<String> getShuffledAnswers() {
    final shuffledList=List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
