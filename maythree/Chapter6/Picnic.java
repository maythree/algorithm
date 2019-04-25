import java.util.OptionalInt;
import java.util.stream.IntStream;

/**
 * 안드로메다 유치원 익스프레스반에서는 다음 주에 율동공원으로 소풍을 갑니다. 원석 선생님은 소풍 때 학생들을
 * 두명씩 짝을 지어 행동하게 하려고 합니다. 그런데 서로친구가 아닌 학생들끼리 짝을 지어 주면 서로 싸우거나 같이 돌아다니지
 * 않기 때문에, 항상 서로 친구인 학생들끼리만 짝을 지어야 합니다.
 * 각 학생들의 쌍에 대해 이들이 서로 친구인지 여부가 주어질 때, 학생들을 짝지을 수 있는 방법의 수를 계산하는 프로그램을
 * 작성하세요. 짝이 되는 학생들이 일부만 다르더라도 다른 방법이라고 봅니다. 예를 들어 다음 두가지 방법은 서로 다른 방법입니다.
 * (태연, 제시카)(써니, 티파니)(효연, 유리)
 * (태연, 제시카)(써니, 유리)(효연, 티파니)
 * <p>
 * INPUT
 * 3
 * 2 1
 * 0 1
 * 4 6
 * 0 1 1 2 2 3 3 0 0 2 1 3
 * 6 10
 * 0 1 0 2 1 2 1 3 1 4 2 3 2 4 3 4 3 5 4 5
 * <p>
 * OUTPUT
 * 1
 * 3
 * 4
 */
public class Picnic {
    public static int studentCount = 0;
    public static boolean[][] friend;
    public static int count = 0;

    public static void main(String[] args) {
        boolean[] checkList;

        studentCount = 2;
        friend = new boolean[studentCount][studentCount];
        friend[0][1] = true;
        checkList = new boolean[studentCount];
        count = 0;
        findPair(checkList);
        System.out.println(count);

        studentCount = 4;
        friend = new boolean[studentCount][studentCount];
        friend[0][1] = true;
        friend[0][2] = true;
        friend[0][3] = true;
        friend[1][2] = true;
        friend[1][3] = true;
        friend[2][3] = true;

        checkList = new boolean[studentCount];
        count = 0;
        findPair(checkList);
        System.out.println(count);

        studentCount = 6;
        friend = new boolean[studentCount][studentCount];
        friend[0][1] = true;
        friend[0][2] = true;
        friend[1][2] = true;
        friend[1][3] = true;
        friend[1][4] = true;
        friend[2][3] = true;
        friend[2][4] = true;
        friend[3][4] = true;
        friend[3][5] = true;
        friend[4][5] = true;

        checkList = new boolean[studentCount];
        count = 0;
        findPair(checkList);
        System.out.println(count);
    }

    public static void findPair(boolean[] checkList) {
        OptionalInt notPairStudent = minMember(checkList);
        if (!notPairStudent.isPresent()) {
            count++;
            return;
        }
        Integer notPairStudentIndex = notPairStudent.getAsInt();

        boolean[] isFriend = friend[notPairStudentIndex];

        IntStream.range(0, studentCount)
                .filter(index -> isFriend[index] && !checkList[index])
                .forEach(pairWith -> {
                    checkList[notPairStudentIndex] = checkList[pairWith] = true;
                    findPair(checkList);
                    checkList[notPairStudentIndex] = checkList[pairWith] = false;
                });
    }

    private static OptionalInt minMember(boolean[] checkList) {
        return IntStream.range(0, checkList.length)
                .filter(index -> !checkList[index])
                .findFirst();
    }
}
