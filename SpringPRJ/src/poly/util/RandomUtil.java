package poly.util;

public class RandomUtil {

	
	public static int RandomNum() {
		int buffer = 0;
		for (int i = 0; i < 1; i++) {
			int n = (int) (Math.random() * 10);
			buffer = n;

		}
		return buffer;
	}
	
	
}
