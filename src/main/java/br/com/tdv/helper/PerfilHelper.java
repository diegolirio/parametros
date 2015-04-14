package br.com.tdv.helper;

import br.com.tdv.helper.xstream.CalendarConverter;
import br.com.tdv.model.Perfil;

import com.thoughtworks.xstream.XStream;

public class PerfilHelper {

	public static String toXml(Perfil perfil) {
		XStream xStream = new XStream();
		xStream.alias("perfil", Perfil.class); 
		xStream.registerConverter(new CalendarConverter());
		return xStream.toXML(perfil);
	}
	
}
