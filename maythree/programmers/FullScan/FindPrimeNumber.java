package programmers.FullScan;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class FindPrimeNumber {
    public static void main(String[] args) {
        System.out.println(solution("011"));
    }

    public static int solution(String numbers) {
        int[] arr = numbers.chars().map(val -> val - '0').toArray();

        Set<Integer> result = new HashSet<>();
        for (int i = 1; i <= arr.length; i++) {
            result.addAll(permutation(arr, 0, arr.length, i, new HashSet<>()));
        }

        return Math.toIntExact(result.stream().filter(value -> checkPrimeNumber(value)).count());
    }

    public static Set<Integer> permutation(int[] arr, int depth, int n, int k, Set<Integer> result) {
        if (depth == k) {
            result.add(generateNumber(arr, k));
            return result;
        }
        for (int i = depth; i < n; i++) {
            swap(arr, i, depth);
            permutation(arr, depth + 1, n, k, result);
            swap(arr, i, depth);
        }
        return result;
    }

    public static void swap(int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    public static Integer generateNumber(int[] arr, int k) {
        int[] numbers = Arrays.copyOfRange(arr, 0, k);
        return Integer.parseInt(IntStream.range(0, numbers.length)
                .mapToObj(index -> Integer.toString(numbers[index]))
                .collect(Collectors.joining()));
    }


    public static boolean checkPrimeNumber(int number) {
        if (number == 0 || number == 1) {
            return false;
        }
        return !IntStream.range(2, number).anyMatch(value -> number % value == 0);
    }
}
