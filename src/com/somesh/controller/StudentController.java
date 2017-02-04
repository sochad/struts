package com.somesh.controller;
/*
 * Author: Somesh
 * This class is the main controller used to do all the work
 * */
import com.somesh.dao.StudentDao;
import com.somesh.dao.StudentDaoImplementation;
import com.somesh.model.Student;
import com.somesh.model.Data;
import com.somesh.model.DataProcessor;

public class StudentController {

	private String sid;
	private StudentDao dao;
	private Data data;
	private Student student;

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public void setData(Data data){
		this.data = data;
	}
	
	public Data getData(){
		return data;
	}
	
	public void setStudent(Student student){
		this.student = student;
	}
	
	public Student getStudent(){
		return student;
	}

	public String next() {
		dao = new StudentDaoImplementation();
		System.out.println("sid:"+sid);
		student = dao.getStudent(sid);
		String address;
		if(sid == null){
			address = "error";}
		else{
			address = "success";}
		return address;
	}

	public String execute() {

		String addr;
		double mean;
		System.out.println("Inside store data() ");

		System.out.println("studentId:"+student.getStudentId()+" FirstName:"+student.getFirstName()+student.getLastName()
				+student.getAddress()+student.getCity()+student.getEmail());
		
		dao = new StudentDaoImplementation();
		dao.addStudent(student);

		System.out.println(student.getData());

		data = DataProcessor.calculateMeanStandardDeviation(student.getData());
		mean = data.getMean();
		System.out.println("The mean is" + mean);

		if(mean >= 90){
			addr = "winner";
		}else{
			addr = "loser";
		}
		return addr;
	}
}
