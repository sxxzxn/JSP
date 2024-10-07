package net.fullstack7.common;

import org.apache.tomcat.jakartaee.commons.lang3.StringUtils;

public class TestUtils {
	
	public static boolean isNumeric(String param) {
//		char[] arrChar = param.toCharArray();
//		for (int i=0; i<arrChar.length; i++) {
//			if( ! (arrChar[i] >= '0' && arrChar[i] <='9') ) {
//				return false;
//			}
//		}
//		return true;
	return StringUtils.isNumeric(param);
	}
	public static int getStringToInt(String param) {
		return (StringUtils.isNumeric(param) ? Integer.parseInt(param) : 0);
	}
	
}
