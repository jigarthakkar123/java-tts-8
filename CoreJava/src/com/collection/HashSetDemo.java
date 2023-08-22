package com.collection;

import java.util.HashSet;

public class HashSetDemo {

	public static void main(String[] args) {
		HashSet hs=new HashSet();
		hs.add(10);
		hs.add(10.10);
		hs.add("tops");
		hs.add('t');
		hs.add(null);
		hs.add(true);
		hs.add("tops");
		
		System.out.println(hs);
		hs.add(100);
		System.out.println(hs);
	}
}
