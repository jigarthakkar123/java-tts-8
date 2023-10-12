package com.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.Employee;
import com.bean.EmployeeInfo;
import com.bean.Student;

public class StudentUtil {

	public static Session createSession()
	{
		SessionFactory sf=new Configuration()
				.addAnnotatedClass(Student.class)
				.addAnnotatedClass(EmployeeInfo.class)
				.addAnnotatedClass(Employee.class)
				.configure()
				.buildSessionFactory();
		Session session=sf.openSession();
		return session;
	}
}
