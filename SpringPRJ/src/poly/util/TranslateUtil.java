package poly.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import poly.dto.NewsDTO;



public class TranslateUtil {
	public static void main(String[] args) throws Exception {
		
		
		System.out.println(kakaotrans("my name is lee jae hoon"));

	}
	
	public static String kakaotrans(String sentence) throws Exception {

		String apikey = "90ca526dfb732b87fc0d04f830e4b867"; // REST API 키

		String postParams = "src_lang=en&target_lang=kr&query=";
		String apiURL = "https://dapi.kakao.com/v2/translation/translate?" + postParams;

		
		String sent = URLEncoder.encode(sentence, "UTF-8");
		String queryURL = apiURL + sent;
		URL url = new URL(queryURL);

		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		String userCredentials = apikey;
		String basicAuth = "KakaoAK " + userCredentials;
		con.setRequestProperty("Authorization", basicAuth);
		con.setRequestMethod("GET");
		con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		con.setRequestProperty("charset", "utf-8");
		con.setUseCaches(false);
		con.setDoInput(true);
		con.setDoOutput(true);
		int responseCode = con.getResponseCode();
		System.out.println("response code : " + responseCode);

		BufferedReader br;
		if (responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
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

	}
}
