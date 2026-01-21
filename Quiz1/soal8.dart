import 'dart:io';

void main() {
  List pembagi = [];
  int total = 0;

  stdout.write("Input angka:");
  String? input = stdin.readLineSync(); 
  
  int num = int.parse(input ?? "");

  for (int i = 1; i < num; i++){
    if (num % i == 0) {
      pembagi.add(i);
    }
  }

  for (int x in pembagi){
    if (x < num){
      
      total += x;
    }
  }

  if (total == num) {
    print ("true");
  } else {
    print ("false");
  }

}