package com.thread;

class Callback
{
	public void call(String msg)
	{
		System.out.print("["+msg);
		try {
			Thread.sleep(4000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("]");
	}
}
class Caller implements Runnable
{
	String msg;
	Thread t;
	Callback c;
	public Caller(String msg,Callback c) {
		this.msg=msg;
		this.c=c;
		t=new Thread(this);
		t.start();
	}
	public void run() {
		synchronized (c) {
			c.call(msg);
		}
		
	}
	
}
public class ThreadSynch {

	public static void main(String[] args) {
		Callback c=new Callback();
		
		Caller c1=new Caller("Hello", c);
		Caller c2=new Caller("World", c);
		Caller c3=new Caller("Synchronization", c);
	}
}
