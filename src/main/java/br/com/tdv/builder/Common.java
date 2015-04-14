package br.com.tdv.builder;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Common {

	/**
	 * Convert data string em Date
	 * @param data
	 * @return Date
	 * @throws ParseException
	 * @throws SQLException
	 */
	public static Date toDate(String data) throws ParseException, SQLException {
		Date dataLocal = null;
		if(data != null && !"".equals(data)) {	
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");					  
			dataLocal = new java.sql.Date(format.parse(data).getTime());
		}
		return dataLocal;
	}	 
	
	public static Calendar toCalendar(String data) throws ParseException, SQLException {
		Calendar calendar = null;
		if(data != null && !"".equals(data)) {	
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");					  
			calendar = Calendar.getInstance();
			calendar.setTime(new java.sql.Date(format.parse(data).getTime()));
		}
		return calendar;
	}	 	
}
