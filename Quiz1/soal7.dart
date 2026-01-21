
void main() {
  List a = [1,3,5,7];
  List b = [2,4,6,8];
  List c = [];

  for (var x in a) {
    c.add(x);
  }

  for (var i in b) {
    c.add(i);
  }
  
  c.sort();
  print (c[c.length-2]);
  
}