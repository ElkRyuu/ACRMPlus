package cn.hlj.crm.test;

import org.junit.Test;

public class TempTest {

	@Test
	public void test() {
		String tempStr = "ID,MEMO,MOBILE,NAME,POSITION,SEX,TEL";
		String lowerCase = new String(tempStr).toLowerCase();
		System.out.println(lowerCase);
		
	}
	
}
