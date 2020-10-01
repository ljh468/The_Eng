package poly.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;

public class TranslateUtil {
	
	
	try
	{	
		String apikey = "90ca526dfb732b87fc0d04f830e4b867"; // REST API 키
		String text = URLEncoder.encode("hello", "UTF-8"); // 번역될 문장
		String postParam = "src_lang=en&target_lang=kr$query="+text;
		String apiURL = "https://kapi.kakao.com/v2/translation/translate?"+postParam;
		
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		String userCredentials = apikey;
		String basicAuth = "KakaoAK" + userCredentials;
		con.setRequestProperty("Authorization", basicAuth);
		con.setRequestMethod("GET");
		con.setRequestProperty("Content-Type", "app;lication/x-www-form-urlencoded");
		con.setRequestProperty("charset", "utf-8");
		
		con.setUseCaches(false);
		con.setDoInput(true);
		con.setDoOutput(true);
		int responseCode = con.getResponseCode();
		System.out.println("responseCode : " + responseCode);
		BufferedReader br;
		if(responseCode==200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		}
		else { // 에러발생
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		JSONObject json = new JSONObject(res.toString());

		String translated = ((JSONArray) json.getJSONArray("translated_text").get(0)).getString(0);

		return translated;
	}catch (Exception e)
	{
		System.out.println("translate 오류발생!!");
		System.out.println(e);
	}
}
