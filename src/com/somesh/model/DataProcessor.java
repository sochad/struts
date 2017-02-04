package com.somesh.model;

import com.somesh.model.Data;

public class DataProcessor {

	public static Data calculateMeanStandardDeviation(String s){

		double mean = 0;
		double sd = 0;

		if(s==null){
			Data d = new Data();
			d.setMean(mean);
			d.setStandardDeviation(sd);
			return d;
		}
		String[] temp = s.split(",");	
		for(String t : temp)
			mean += Double.parseDouble(t);
		
		mean = mean/temp.length;

		for(String t : temp)
			sd += ((Double.valueOf(t) - mean) * (Double.valueOf(t) - mean)) ;

		sd = sd/temp.length;
		sd = Math.sqrt(sd);
		Data d = new Data();
		d.setMean(mean);
		d.setStandardDeviation(sd);
		return d;
	}
}
