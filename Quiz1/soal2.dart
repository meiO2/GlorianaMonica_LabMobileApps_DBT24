import 'dart:io';
import 'dart:math';

void main() {
  List option = ["batu", "gunting", "kertas"];

  final random = Random();
  int randNumber = random.nextInt(3);

  print(randNumber);
  print(option[randNumber]);

  stdout.write("pilih batu, gunting atau kertas");
  String? input = stdin.readLineSync();

  if (input == null) {
    //continue;
  } else if (option[randNumber] == input) {
    print("you win!");
  }
}