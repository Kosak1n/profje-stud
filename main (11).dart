import 'dart:math';

class BankAccount {
  String accountNumber;
  double balance = 0;
  String ownerName;

  BankAccount(this.ownerName) : accountNumber = _generateAccountNumber();

  static String _generateAccountNumber() {
    Random random = Random();
    String number = "";
    for (int i = 0; i < 10; i++) {
      number += random.nextInt(10).toString();
    }
    return number;
  }

  void deposit(double amount) {
    if (amount <= 0) {
      print("Нельзя внести отрицательную сумму");
      return;
    }
    balance += amount;
  }

  void withdraw(double amount) {
    if (amount > balance) {
      print("Недостаточно средств");
      return;
    }
    balance -= amount;
  }

  void displayBalance() {
    print("Баланс счета $accountNumber: $balance");
  }
}

class Bank {
  List<BankAccount> accounts = [];

  BankAccount addAccount(String ownerName) {
    BankAccount account = BankAccount(ownerName);
    accounts.add(account);
    return account;
  }

  BankAccount? findAccount(String accountNumber) {
    for (var acc in accounts) {
      if (acc.accountNumber == accountNumber) {
        return acc;
      }
    }
    return null;
  }

  void transfer(String fromAccountNumber, String toAccountNumber, double amount) {
    BankAccount? from = findAccount(fromAccountNumber);
    BankAccount? to = findAccount(toAccountNumber);

    if (from == null || to == null) {
      print("Один из счетов не найден");
      return;
    }

    if (amount <= 0) {
      print("Некорректная сумма");
      return;
    }

    if (from.balance < amount) {
      print("Недостаточно средств для перевода");
      return;
    }

    from.withdraw(amount);
    to.deposit(amount);
    print("Перевод выполнен");
  }
}

void main() {
  Bank bank = Bank();

  BankAccount acc1 = bank.addAccount("Иван");
  BankAccount acc2 = bank.addAccount("Анна");

  acc1.deposit(1000);

  bank.transfer(acc1.accountNumber, acc2.accountNumber, 300);

  acc1.displayBalance();
  acc2.displayBalance();
}