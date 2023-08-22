package com.core;

import java.util.Scanner;

class A
{
	int a;
	void setA()
	{
		Scanner sc=new Scanner(System.in);
		System.out.print("Enter A : ");
		a=sc.nextInt();
	}
	void putA()
	{
		System.out.println("A : "+a);
	}
}
class B extends A
{
	int b;
	void setB()
	{
		Scanner sc=new Scanner(System.in);
		System.out.print("Enter B : ");
		b=sc.nextInt();
	}
	void putB()
	{
		System.out.println("B : "+b);
	}
}
class C extends A
{
	int c;
	void setC()
	{
		Scanner sc=new Scanner(System.in);
		System.out.print("Enter C : ");
		c=sc.nextInt();
	}
	void putC()
	{
		System.out.println("C : "+c);
	}
}
public class InheritanceDemo {

	public static void main(String[] args) {
		B b1=new B();
		C c1=new C();
		b1.setA();
		b1.setB();
		c1.setC();
		b1.putA();
		b1.putB();
		c1.putC();
	}
}
