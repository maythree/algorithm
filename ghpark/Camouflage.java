package ghpark;
import java.util.HashMap;

public class Camouflage {
	private HashMap<String, Integer> setClothesCount(String[][] clothes) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		for (String[] clothesSet : clothes) {
			String partOfBody = clothesSet[1];
			if (map.containsKey(partOfBody)) {
				map.put(partOfBody, map.get(partOfBody) + 1);
			} else {              
				map.put(partOfBody, 2);
			}
		}
		return map;
	}
	public int solution(String[][] clothes) {
		int answer = 1;
		HashMap<String, Integer> hashMap = setClothesCount(clothes);        
		for (String key : hashMap.keySet()){
			answer *= hashMap.get(key);
		}
		return answer - 1;
	}
}
