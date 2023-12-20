enum RockPaperScissors { rock, paper, scissors }

class RockPaperScissorsPolicy {
  static Map<String, int> rockPaperScissorsValue = {
    'S': 1,
    'R': 2,
    'P': 3,
  };

  static String getChoice(RockPaperScissors choice) {
    switch (choice) {
      case RockPaperScissors.paper:
        return 'P';
      case RockPaperScissors.rock:
        return 'R';
      case RockPaperScissors.scissors:
        return 'S';
    }
  }

  // If user choice Scissors
  // => Map value: {
  //                  'S': 1,
  //                  'R': 2,
  //                  'P': 0
  //                }
  // If user choice Paper
  // => Map value: {
  //                  'S': 4,
  //                  'R': 2,
  //                  'P': 3
  //                }
  static void changeValue(String userChoice) {
    if (userChoice == 'S') {
      rockPaperScissorsValue['P'] = 0;
      rockPaperScissorsValue['S'] = 1;
    }
    if (userChoice == 'P') {
      rockPaperScissorsValue['P'] = 3;
      rockPaperScissorsValue['S'] = 4;
    }
  }
}
