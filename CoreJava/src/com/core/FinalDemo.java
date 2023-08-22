package com.core;

class f1
{
	final int a;
	public f1() {
		a=10;
	}
	void show()
	{
		System.out.println("show from f1");
	}
}
class f2 extends f1
{
	void show()
	{
		System.out.println("show from f2");
	}
}

public class FinalDemo {

	public static void main(String[] args) {
		
	}
}
