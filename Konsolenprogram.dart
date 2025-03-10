
import 'dart:io';

class BankAccount {
  String owner;
  double balance;

  BankAccount(this.owner, [this.balance = 0.0]);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('\n$owner hat $amount eingezahlt. Neuer Kontostand: $balance');
    } else {
      print('Ungültiger Betrag!');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print('$owner hat $amount abgehoben. Neuer Kontostand: $balance');
    } else {
      print('Abhebung nicht möglich!');
    }
  }

  void showBalance() {
    print('Kontoinhaber: $owner, Kontostand: $balance');
  }
}

void main() {
  stdout.write('Geben Sie den Namen des Kontoinhabers ein: ');
  String owner = stdin.readLineSync()!;
  
  BankAccount account = BankAccount(owner);

  while (true) {
    print('Wählen Sie eine Aktion:');
    print('1: Einzahlen');
    print('2: Abheben');
    print('3: Kontostand anzeigen');
    print('4: Beenden');
    stdout.write('Auswahl: ');
    
    String? choice = stdin.readLineSync();
    
    switch (choice) {
      case '1':
        stdout.write('Betrag zum Einzahlen: ');
        double amount = double.parse(stdin.readLineSync()!);
        account.deposit(amount);
        break;
      case '2':
        stdout.write('Betrag zum Abheben: ');
        double amount = double.parse(stdin.readLineSync()!);
        account.withdraw(amount);
        break;
      case '3':
        account.showBalance();
        break;
      case '4':
        print('Programm beendet.');
        return;
      default:
        print('Ungültige Auswahl!');
    }
  }
}
