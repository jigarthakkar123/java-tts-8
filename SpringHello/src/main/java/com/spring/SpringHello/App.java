package com.spring.SpringHello;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        AbstractApplicationContext a=new ClassPathXmlApplicationContext("Beans.xml");
        Student s1=a.getBean("s2",Student.class);
        System.out.println("ID : "+s1.getId());
        System.out.println("First Name : "+s1.getFname());
        System.out.println("Last Name : "+s1.getLname());
        System.out.println("Email : "+s1.getEmail());
        a.registerShutdownHook();
    }
}
