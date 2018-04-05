package services;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.CharBuffer;
import java.sql.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.hibernate.annotations.common.reflection.java.generics.TypeEnvironmentFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.embedded.OutputStreamFactory;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import models.IngredientDao;

@Service
public class IngredientPriceUpdateService {
	@Autowired
	IngredientDao ingredientDao;
	@Autowired
	Gson gson;
	
	private final String cert_id = "shw112";
	private final String cert_key = "1ef5eacb-c04a-4139-b207-318b641bdbde";
	private final List<String> keyList = Arrays.asList("m12", "m11", "m10", "m9", "m8", "m7", "m6", "m5", "m4", "m3", "m2", "m1");
	
	public List getPriceList(String word) {
		return ingredientDao.getPriceList(word);
	}
	
	
	public void updatePriceAll() {
		// http://www.kamis.or.kr/service/price/xml.do?
		// action=monthlySalesList&p_yyyy=2018&p_period=1
		// &p_itemcode=111&p_kindcode=01&p_countycode=1101
		// &p_convert_kg_yn=N&p_cert_key=1ef5eacb-c04a-4139-b207-318b641bdbde
		// &p_cert_id=shw112&p_returntype=json
		List<HashMap> targetList = ingredientDao.getAllCode();
		if (targetList != null) {
			Iterator<HashMap> iter = targetList.iterator();
			while(iter.hasNext()) {	
				HashMap item = iter.next();
				URL url;
				try {
					url = new URL("http://www.kamis.or.kr/service/price/xml.do?action=monthlySalesList" 
							+ "&p_yyyy=2018"
							+ "&p_period=1" 
							+ "&p_countycode=1101" 
							+ "&p_convert_kg_yn=N" 
							+ "&p_returntype=json"
							+ "&p_cert_key=" + cert_key 
							+ "&p_cert_id=" + cert_id 
							+ "&p_itemcode=" + (String) item.get("ITEM_CODE") 
							+ "&p_kindcode" + (String) item.get("CLASS_CODE"));
					// ref: https://www.data.go.kr/comm/file/download.do?atchFileId=FILE_000000000375574&fileDetailSn=0
					InputStream in = url.openStream();
					CachedOutputStream bos = new CachedOutputStream();
					IOUtils.copy(in, bos);
					in.close();
					bos.close();

					String data = bos.getOut().toString();
					Object c = gson.fromJson(data, HashMap.class).get("price");
					String latestMonthPrice = "-";
					if (c instanceof ArrayList) {
						ArrayList priceInfo = (ArrayList) c;
						Iterator iter_b = priceInfo.iterator();
						while(iter_b.hasNext()) {
							Object a = iter_b.next();
							if (a instanceof Map) {
								if(((Map) a).get("productclscode").equals("01")) {
									Object b = ((Map) a).get("item");
									if (b instanceof ArrayList) {
										Map latestYearPrice = (Map)((ArrayList) b).get(((ArrayList) b).size()-1);
										Iterator iter_c = keyList.iterator(); 
										while(latestMonthPrice.equals("-") && iter_c.hasNext()) {
											latestMonthPrice = (String) latestYearPrice.get((String)iter_c.next());
										}
									}
								}
							}
						}
					} else if (c instanceof Map) {
						if(((Map) c).get("productclscode").equals("01")) {
							Object b = ((Map) c).get("item");
							if (b instanceof ArrayList) {
								Map latestYearPrice = (Map)((ArrayList) b).get(((ArrayList) b).size()-1);
								Iterator iter_c = keyList.iterator(); 
								while(latestMonthPrice.equals("-") && iter_c.hasNext()) {
									latestMonthPrice = (String) latestYearPrice.get((String)iter_c.next());
								}
							}
						}
					}
					if (!latestMonthPrice.equals("-")) {
						ingredientDao.updatePrice(
								(String) item.get("ITEM_CODE"),
								(String) item.get("CLASS_CODE"), 
								Integer.valueOf(latestMonthPrice.replaceAll(",", ""))
						);
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
