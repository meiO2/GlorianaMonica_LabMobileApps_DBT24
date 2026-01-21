void main() {
  List a = [1,4,9,16,25,36,49,64,81,100];
  List b = [];

  for (var x in a) {
    if (x % 2 == 0) {
      b.add(x);
    }
  }

  print(b);
}