import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  int randNumber = random.nextInt(3);
  int percobaan = 0;

  stdout.write("Masukkan angka tebakan:");
  int input = stdin.readByteSync();
  while (randNumber != input) {
    if (input < randNumber) {
      print ("tebakan terlalu kecil");
      percobaan += 1;
    } else if (input > randNumber) {
      print ("tebakan terlalu besar");
      percobaan += 1;
    }
  }
  print ("Selamat, berhasil menebak setelah $percobaan percobaan");
}