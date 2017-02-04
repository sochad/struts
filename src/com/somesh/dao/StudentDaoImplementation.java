package com.somesh.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/*
 * Author: Somesh
 * This class is the dao used to do all the database work
 * */
import com.somesh.model.Student;


public class StudentDaoImplementation implements StudentDao {
 
    private Connection conn;
    private static final String DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String DB_CONNECTION = "jdbc:oracle:thin:@apollo.vse.gmu.edu:1521:ite10g";
	private static final String DB_USER = "schadda";
	private static final String DB_PASSWORD = "ozechy";
	
	private static Connection getDBConnection() {
		Connection dbConnection = null;
		try {
			Class.forName(DB_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		try {
			dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,DB_PASSWORD);
			return dbConnection;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return dbConnection;
	}

    @Override
    public void addStudent( Student student ) {
        
        Connection dbConnection = null;
		PreparedStatement preparedStatement = null;

		String insertTableSQL = "INSERT INTO STUDENT"
				+ "(STUDENTID, FIRSTNAME, LASTNAME, ADDRESS, PHONE, EMAIL, ZIP, CITY, STATE, URL, SURVEYDATE) VALUES"
				+ "(?,?,?,?,?,?,?,?,?,?,?)";

		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(insertTableSQL);
			
			preparedStatement.setString(1, student.getStudentId());
			preparedStatement.setString(2, student.getFirstName());
			preparedStatement.setString(3, student.getLastName());
			preparedStatement.setString(4, student.getAddress());
			preparedStatement.setString(5, student.getPhone());
			preparedStatement.setString(6, student.getEmail());
			preparedStatement.setString(7, student.getZip());
			preparedStatement.setString(8, student.getCity());
			preparedStatement.setString(9, student.getState());
			preparedStatement.setString(10, student.getUrl());
			preparedStatement.setString(11, student.getSurveyDate());
			
			// execute insert SQL statement
			preparedStatement.executeUpdate();

			System.out.println("Record is inserted into DBUSER table!");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (dbConnection != null) {
				try {
					dbConnection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
        
    @Override
    public Student getStudent(String studentId) {
        Student student = new Student();
        try {
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@apollo.vse.gmu.edu:1521:ite10g", "schadda", "ozechy");
            String query = "select * from student where studentId=?";
            PreparedStatement preparedStatement = conn.prepareStatement( query );
            preparedStatement.setString(1, studentId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while( resultSet.next() ) {
                student.setStudentId( resultSet.getString( "studentId" ) );
                student.setFirstName( resultSet.getString( "firstName" ) );
                student.setLastName( resultSet.getString( "lastName" ) );
                student.setAddress( resultSet.getString( "address" ) );
                student.setPhone( resultSet.getString( "phone" ) );
                student.setEmail( resultSet.getString( "email" ) );
                student.setZip( resultSet.getString( "zip" ) );
                student.setCity( resultSet.getString( "city" ) );
                student.setState( resultSet.getString( "state" ) );
                student.setUrl( resultSet.getString( "url" ) );
                student.setSurveyDate( resultSet.getString( "surveydate" ) );
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return student;
    }
}
