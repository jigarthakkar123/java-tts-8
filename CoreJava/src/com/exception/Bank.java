package com.exception;

import java.util.Scanner;

public class Bank {

	public static void main(String[] args) {
		int acno,choice;
		String cname;
		double balance,amount;
		CheckingAccount c=new CheckingAccount(101, "Jigar", 1000);
		Scanner sc=new Scanner(System.in);
		
		while(true) {
			System.out.println("***********************************");
			System.out.println("1. Deposit");
			System.out.println("2. Withdrawl");
			System.out.println("3. Check Balance");
			System.out.println("4. Exit");
			System.out.println("***********************************");
			System.out.print("Enter Your Choice : ");
			choice=sc.nextInt();
			System.out.println("***********************************");
			
			if(choice==1)
			{
				System.out.println("***********************************");
				System.out.print("Enter Deposit Amount : ");
				amount=sc.nextDouble();
				c.deposit(amount);
				System.out.println("***********************************");
			}
			else if(choice==2)
			{
				System.out.println("***********************************");
				System.out.print("Enter Withdrawal Amount : ");
				amount=sc.nextDouble();
				try {
					c.withdraw(amount);
					System.out.println("***********************************");
				} catch (InSufficientFund e) {
					System.out.println("Sorry You Need Another "+e.getAmount());
					System.out.println("***********************************");
				}
			}
			else if(choice==3)
			{
				System.out.println("***********************************");
				c.checkBalance();
				System.out.println("***********************************");
			}
			else if(choice==4)
			{
				System.out.println("***********************************");
				System.out.println("Thank You For Using Our Services.");
				break;
			}
			else
			{
				System.out.println("***********************************");
				System.out.println("Invalid Choice. Please Try Again.");
				System.out.println("***********************************");
			}
		}
	}
}
