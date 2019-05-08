package programmers.FullScan;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.IntStream;

public class MockExam {
    public static void main(String[] args) {
        int[] answers = {6,6,6,6,6};
        System.out.println(Arrays.toString(solution(answers)));
    }

    private static int[] solution(int[] answers) {
        int[] mathGiveUpPerson1 = {1, 2, 3, 4, 5};
        int[] mathGiveUpPerson2 = {2, 1, 2, 3, 2, 4, 2, 5};
        int[] mathGiveUpPerson3 = {3, 3, 1, 1, 2, 2, 4, 4, 5, 5};

        long answerCount1 = getAnswerCount(answers, mathGiveUpPerson1);
        long answerCount2 = getAnswerCount(answers, mathGiveUpPerson2);
        long answerCount3 = getAnswerCount(answers, mathGiveUpPerson3);

        List<Long> answerList = Arrays.asList(answerCount1, answerCount2, answerCount3);
        Long maxCount = Collections.max(answerList);

        return IntStream.range(0, answerList.size())
                .filter(index -> answerList.get(index) == maxCount)
                .map(index -> index + 1)
                .toArray();
    }

    private static long getAnswerCount(int[] rightAnswers, int[] solves) {
        return IntStream.range(0, rightAnswers.length)
                .parallel()
                .filter(index -> rightAnswers[index] == solves[index%solves.length])
                .count();
    }
}
