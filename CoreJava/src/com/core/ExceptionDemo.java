package com.core;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ExceptionDemo {

	public static void main(String[] args) {
		System.out.println("Start Code");
		int a,b,c;
		Scanner sc=new Scanner(System.in);
		try {
			System.out.print("Enter A : ");
			a=sc.nextInt();
			System.out.print("Enter B : ");
			b=sc.nextInt();
			
			c=a/b;
			System.out.println("Division : "+c);
			
			int arr[]= {1,2,3,4,5};
			System.out.print("Enter Index Number : ");
			int index=sc.nextInt();
			System.out.println("Data At Index : "+arr[index]);
		}catch(Exception e) {
			System.out.println("Exception Caught : "+e);
		}
		System.out.println("End Code");
	}
}
