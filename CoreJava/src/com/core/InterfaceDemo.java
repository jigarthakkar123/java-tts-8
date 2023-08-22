package com.core;

interface ifs1
{
	static void meth1()
	{
		System.out.println("Meth1 Defined In ifs1");
	}
}
interface ifs2 extends ifs1
{
	void meth2();
}
public class InterfaceDemo implements ifs2{
	
	public void meth2() {
		System.out.println("Meth2 Defined In Class");
	}
	public static void main(String[] args) {
		InterfaceDemo i=new InterfaceDemo();
		ifs1.meth1();
		i.meth2();
	}
}
