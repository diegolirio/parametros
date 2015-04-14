package br.com.tdv.helper;

import com.thoughtworks.xstream.XStream;

import br.com.tdv.helper.xstream.CalendarConverter;
import br.com.tdv.model.AplicacaoPerfil;

public class AplicacaoPerfilHelper {
	
	/**
	 * Serializa AplicacaoPerfil para xml
	 * @param aplicacaoPerfil
	 * @return String
	 */
	public static String toXml(AplicacaoPerfil aplicacaoPerfil) {
		XStream xStream = new XStream();
		xStream.alias("aplicacaoPerfil", AplicacaoPerfil.class);
		xStream.registerConverter(new CalendarConverter());
		return xStream.toXML(aplicacaoPerfil);
	}

}
