import 'dart:io';
import 'dart:math';

void main() {

}

void cek(x) {
  List c = [1,];

  for (var i = 0; i < 9; i++){
    if (x % i == 0){
      c.add(i);
    }
  }

  if (c.length == 2) {
    return c.length;
  }
}