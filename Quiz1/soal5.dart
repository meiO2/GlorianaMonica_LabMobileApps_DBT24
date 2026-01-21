import 'dart:io';

class Ujian {
  int nilai = 0;
  int loop = 0;

  void namaNilai() {
    stdout.write("Input nama student:");
    stdout.write("Input nilai siswa:");
    int inputnilai = stdin.readByteSync();
    nilai += inputnilai;
  }

  void avg() {
    print(nilai/loop);
  }
}

void main() {

}