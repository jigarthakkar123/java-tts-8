package com.core;

import java.util.Scanner;

public class NestedIf {

	public static void main(String[] args) {
		int a,b,c;
		Scanner sc=new Scanner(System.in);
		System.out.print("Enter A : ");
		a=sc.nextInt();
		System.out.print("Enter B : ");
		b=sc.nextInt();
		System.out.print("Enter C : ");
		c=sc.nextInt();
		
		if(a>b)
		{
			if(a>c)
			{
				System.out.println("A Is Greater");
			}
			else
			{
				System.out.println("C Is Greater");
			}
		}
		else
		{
			if(b>c)
			{
				System.out.println("B Is Greater");
			}
			else
			{
				System.out.println("C Is Greater");
			}
		}
	}
}
