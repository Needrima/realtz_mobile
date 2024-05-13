String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minuteString = minutes < 10 ? '0$minutes' : '$minutes';
    String secondString =
        remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
    return '$minuteString:$secondString';
  }