package br.com.tdv.helper.xstream;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.thoughtworks.xstream.converters.ConversionException;
import com.thoughtworks.xstream.converters.SingleValueConverter;

public class CalendarConverter implements SingleValueConverter {

	private static final String DD_MM_YYYY = "dd/MM/yyyy";
	
	@Override
	public boolean canConvert(@SuppressWarnings("rawtypes") Class clazz) {
		return Calendar.class.isAssignableFrom(clazz);
	}

	@Override
	public Object fromString(String value) {
		DateFormat formatter = new SimpleDateFormat(DD_MM_YYYY);
		try {
			Date date = formatter.parse(value);
			Calendar cal = new GregorianCalendar();
			cal.setTime(date);
			return cal;
		} catch (ParseException e) {
			String msg = "Erro ao converter data " + value;
			throw new ConversionException(msg, e);
		}
	}

	@Override
	public String toString(Object obj) {
		DateFormat formatter = new SimpleDateFormat(DD_MM_YYYY);
		 Calendar cal = (Calendar) obj;
		 return formatter.format(cal.getTime());
	}

}
