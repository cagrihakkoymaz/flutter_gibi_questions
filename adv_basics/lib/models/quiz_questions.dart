class QuizQuestion {
  const QuizQuestion(this.text, this.answers,this.ImagePath);

  final String text;
  final List<String> answers;
  final String ImagePath;
  List<String> getShuffledAnswers() {
    final shuffledList=List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
