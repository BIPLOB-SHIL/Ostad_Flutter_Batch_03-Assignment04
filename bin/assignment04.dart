// abstract class
abstract class Account {
// abstract properties
  late int accountNumber;
  late double balance;

// abstract methods
  void deposit (double amount);
  void withdraw(double amount);

}

// saving account class
class SavingAccount extends Account{

  double interestRate;

  SavingAccount (int accountNumber,double balance,this.interestRate ){
    this.accountNumber = accountNumber;
    this.balance = balance;
  }

  @override
  void withdraw(double amount){
    double subtract = balance-amount;
    balance = subtract;
    double interest = subtract*(interestRate/100); // @ interestRate %
    print("After withdrawing the remaining balance is (SavingAccount) $subtract BDT");
    print("Interest in the remaining balance: $interest BDT @ $interestRate %");
  }
  @override
  void deposit (double amount){
    double add = balance + amount;
    print("After depositing the available balance is (SavingAccount) $add BDT");
  }
}

// current account class
class CurrentAccount extends Account{

  double overdraftLimit;

  CurrentAccount (int accountNumber,double balance,this.overdraftLimit ){
    this.accountNumber = accountNumber;
    this.balance = balance;
  }

  @override
  void deposit(double amount) {
    double add = balance + amount;
    print("After depositing the available balance is (CurrentAccount): $add BDT");
  }

  @override
  void withdraw(double amount) {
    if (amount > overdraftLimit){
      print("Indicating insufficient funds");
    }else{
      double subtract = balance-amount;
      balance = subtract;
      print("After withdrawing the remaining balance is (CurrentAccount) $subtract BDT");
    }
  }


}


void main(){

  // instance of the savingsAccount class
  SavingAccount savingAccount = SavingAccount(20230521,30000,12);
  savingAccount.withdraw(15000);
  savingAccount.deposit(30000);
  print("\n");
  // instance of the currentAccount class
  CurrentAccount currentAccount = CurrentAccount(20230522,50000,25000);
  currentAccount.withdraw(25000);
  currentAccount.deposit(30000);

}