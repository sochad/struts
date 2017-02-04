package com.somesh.dao;


import com.somesh.model.Student;

public interface StudentDao {
	public Student getStudent(String id);
	public void addStudent(Student student);
}

