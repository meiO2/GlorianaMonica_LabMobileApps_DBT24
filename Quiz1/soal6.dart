void main() {
  var tes = Account();
  print(tes.balance);
  tes.deposit();
  tes.deposit();
  print(tes.balance);
  tes.withdraw();
  print(tes.balance);
}

class Account {
  int balance = 0;

  void deposit () {
    balance += 1000;
  }

  void withdraw() {
    balance -= 1000;
  }
}

