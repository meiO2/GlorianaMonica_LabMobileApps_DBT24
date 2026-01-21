import 'dart:io';

class Ujian {
  int nilai = 0;
  int loop = 0;
  void cek() {
    stdout.write("Input nama student:");
    String? input = stdin.readLineSync();
    stdout.write("Input nilai siswa:");
    int inputnilai = stdin.readByteSync();
  }

  while (loop != 3) {
    cek();
    loop += 1;
  }
}

void main() {

}