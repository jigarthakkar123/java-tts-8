package com.core;

abstract class RBI
{
	abstract void roi(double r);
}
class SBI extends RBI
{
	void roi(double r) {
		System.out.println("Rate Of Interest Given By SBI : "+r);
	}
}
class ICICI extends RBI
{
	void roi(double r) {
		System.out.println("Rate Of Interest Given By ICICI : "+r);
	}
}
class HDFC extends RBI
{
	void roi(double r) {
		System.out.println("Rate Of Interest Given By HDFC : "+r);
	}
}
public class AbstractDemo {

	public static void main(String[] args) {
		SBI s=new SBI();
		ICICI i=new ICICI();
		HDFC h=new HDFC();
		
		s.roi(5.6);
		i.roi(6.3);
		h.roi(6.7);
	}
}
