package services;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.CharBuffer;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import models.IngredientDao;

@Service
public class IngredientPriceUpdateService {
	@Autowired
	IngredientDao ingredientDao;
	
	private final String cert_id = "shw112";
	private final String cert_key = "1ef5eacb-c04a-4139-b207-318b641bdbde";
	
	public void updatePriceAll() {
		// 	http://www.kamis.or.kr/service/price/xml.do?
		//	action=monthlySalesList&p_yyyy=2018&p_period=1
		// 	&p_itemcode=111&p_kindcode=01&p_countycode=1101
		//	&p_convert_kg_yn=N&p_cert_key=1ef5eacb-c04a-4139-b207-318b641bdbde
		//	&p_cert_id=shw112&p_returntype=json
		List<HashMap> targetList = ingredientDao.getAllCode();
		if (targetList != null) {
			Iterator<HashMap> iter = targetList.iterator();
			while(iter.hasNext()) {
				HashMap item = iter.next();
	            URL url;
	            try {
					url = new URL("http://www.kamis.or.kr/service/price/xml.do?action=monthlySalesList"
							+ "&p_yyyy=2018&p_period=1&p_countycode=1101"
							+ "&p_convert_kg_yn=N&p_returntype=json"
							+ "&p_cert_key=" + cert_key
							+ "&p_cert_id=" + cert_id
							+ "&p_itemcode=" + (String)item.get("ITEM_CODE")
					        + "&p_kindcode" + (String)item.get("CLASS_CODE")
							);
	            URLConnection urlConn = url.openConnection();
	            InputStreamReader isr = new InputStreamReader(urlConn.getInputStream());
//	            System.out.println(str.toString());
	            } catch (MalformedURLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		System.out.println(targetList);
	}
}
