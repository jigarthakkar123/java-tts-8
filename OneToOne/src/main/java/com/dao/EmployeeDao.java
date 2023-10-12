package com.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Employee;
import com.bean.EmployeeInfo;
import com.util.StudentUtil;

public class EmployeeDao {

	public static void insertEmployeeInfo(EmployeeInfo e)
	{
		Session session=StudentUtil.createSession();
		Transaction tr=session.beginTransaction();
		session.save(e);
		tr.commit();
		session.close();
	}
	public static void insertEmployee(Employee e)
	{
		Session session=StudentUtil.createSession();
		Transaction tr=session.beginTransaction();
		session.save(e);
		tr.commit();
		session.close();
	}
}
