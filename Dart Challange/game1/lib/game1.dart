import 'dart:io';
import 'dart:math';

import 'package:game1/policy.dart';

void main() {
  stdout.writeln('Welcome to Rock, Paper, Scissors.');
  stdout.writeln('Type \'exit\' to stop the game');
  int score = 0;
  String userChoice = userChoiceFunc();

  // while end when user input 'exit'
  while (userChoice != 'exit') {
    String pcChoice = getRandomPCChoice();
    score += calculateResult(userChoice: userChoice, pcChoice: pcChoice);
    userChoice = userChoiceFunc();
  }
  stdout.writeln('\n\nYour score: $score');
}

String userChoiceFunc() {
  String? userChoice;
  // Loop until User choice 1 of 4 
  do {
    stdout.write('Please choose Rock(R), Paper(P) or Scissors(S): ');
    userChoice = stdin.readLineSync();
  } while (userChoice == null ||
      (userChoice != "R" &&
          userChoice != 'P' &&
          userChoice != "S" &&
          userChoice != 'exit'));
  return userChoice;
}

String getRandomPCChoice() {
  Random random = Random();
  List<RockPaperScissors> listChoice = RockPaperScissors.values;
  RockPaperScissors pcChoice = listChoice[random.nextInt(listChoice.length)];
  return RockPaperScissorsPolicy.getChoice(pcChoice);
}

int calculateResult({required String userChoice, required String pcChoice}) {
  //Change value of Map RPS before check who's win
  RockPaperScissorsPolicy.changeValue(userChoice);

  int userValue =
      RockPaperScissorsPolicy.rockPaperScissorsValue[userChoice] ?? 0;
  int pcValue = RockPaperScissorsPolicy.rockPaperScissorsValue[pcChoice] ?? 0;

  if (userValue > pcValue) {
    print('You win');
    return 1;
  } else if (userValue < pcValue) {
    print('You lose');
    return -1;
  } else {
    print('Draw score');
  }
  return 0;
}
