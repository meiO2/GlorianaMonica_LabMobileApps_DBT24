import 'dart:io';

class Ujian {
  int nilai = 0;
  int loop = 0;

  void nama() {
    stdout.write("Input nama student:");
    String? input = stdin.readLineSync();
  }

  void nilaii() {
    stdout.write("Input nilai siswa:");
    String? inputnilai = stdin.readLineSync();
    int i = int.parse(inputnilai ?? "");
    nilai += i;
    loop+=1;
  }

  void avg() {
    print(nilai/loop);
  }
}

void main() {
  var tes = Ujian();
  while (tes.loop != 3) {
    tes.nama();
    tes.nilaii();
  }
  tes.avg();
}