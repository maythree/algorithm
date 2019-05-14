package programmers.FullScan;

import java.util.Arrays;

public class Carpet {

    public static void main(String[] args) {
        int[] result = solution(20, 16);
        System.out.println(Arrays.toString(result));
    }

    private static int[] solution(int brown, int red) {
        int maxHeight = red + 2;
        for(int height = 3; height <= maxHeight; height++) {
            System.out.println("height : " + height);
            for (int width = height; (width*2) + ((height-2) * 2) <= brown; width++) {
                System.out.println("width : " + width);
                int redWidth = width - 2;
                int redHeight = height - 2;
                if (redWidth * redHeight == red) {
                    return new int[]{width, height};
                }
            }
        }
        return null;
    }
}
