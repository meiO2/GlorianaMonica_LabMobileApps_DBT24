import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  int randNumber = random.nextInt(100)+1;
  int percobaan = 0;

  stdout.write("Masukkan angka tebakan:");
  int input = int.parse(stdin.readLineSync()!);
  while (input != randNumber) {
    if (input < randNumber) {
      print ("tebakan terlalu kecil");
    } else {
      print ("tebakan terlalu besar");
    }
    percobaan += 1;
    stdout.write("Masukkan angka tebakan:");
    input = int.parse(stdin.readLineSync()!);
  }
  print ("Selamat, berhasil menebak setelah $percobaan percobaan");
}