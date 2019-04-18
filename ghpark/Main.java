import java.util.*;
public class Main {
    //10명의 학생의 짝을 담을 boolean형 2차원 배열 선언
    static boolean areFriends[][] = new boolean[10][10];
    //전체 학생의 수
    static int n;
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        //테스트 케이스
        System.out.print("테스트 케이스?(C<=50):");
        int C = sc.nextInt();
        int result[] = new int[C];
        //테스트 케이스만큼 반복
        for(int i = 0; i < C; ++i) {
            //학생의 수 입력
            System.out.print("학생의 수?(2=<n<=10):");
            n = sc.nextInt();
            //서로 친구인 학생의 수 입력
            System.out.print("서로 친구인 학생의 수?(0<=m<=1부터 n까지의 총합):");
            int m = sc.nextInt();
            //10명의 학생을 담을 배열 선언(false로 초기화)
            boolean taken[] = new boolean[10];
            //서로 친구인 학생의 수만큼 반복
            for(int j = 0; j < m; ++j) {
                System.out.println("서로 친구인 학생 입력?(0<=m<=n-1:)");
                int friends1 = sc.nextInt();
                int friends2 = sc.nextInt();
                //(모모, 성재), (성재, 모모)는 같은 경우이므로, 둘 다 true로 선언.
                areFriends[friends1][friends2] = areFriends[friends2][friends1] = true;
            }
            //경우의 수 계산하여 결과를 보여줄 배열에 할당한다.
            result[i] = countParing(taken);
        }
        //테스트 케이스 수 만큼 반복
        for(int i = 0; i < result.length; ++i) {
            //결과 출력
            System.out.println("결과 : " + result[i]);
        }
        sc.close();
    }

    //taken = i번째 학생이 짝을 이미 찾았으면 true 아니면 false
    private static int countParing(boolean taken[]) {
        //짝을 찾은 인덱스 계산을 위한 변수 선언
        int firstFree = -1;
        //학생(n)의 수 만큼 반복
        for(int i = 0; i < n; ++i) {
            //i번 째 인덱스의 값(친구)이 짝이 지어지지 않았다면
            if(!taken[i]) {
                //해당 인덱스의 값을 짝을 찾을 변수로 변경
                firstFree = i;
                //짝을 지을 학생을 찾았으므로 반복 중지
                break;
            }
        }
        //기저 사례: 모든 학생이 짝을 찾았으면 한 가지 방법을 찾았으니 종료한다.(경우의 수 하나 찾음!)
        if(firstFree == -1) {
            return 1;
        }
        //경우의 수를 더할 변수 선언
        int ret = 0;
        //해당 학생과 친구인지 확인할 변수 = 짝을 찾을 변수(친구) + 1, 짝을 찾을 변수는 전체 학생의 수 만큼 반복
        for(int pairWith = firstFree+1; pairWith < n; ++pairWith) {
            //해당 인덱스가 친구와 짝이 지어지지 않았고, 해당 학생과 친구이면
            if(!taken[pairWith] && areFriends[firstFree][pairWith]) {
                //해당 인덱스는 친구이므로 짝을 지어준다.
                taken[firstFree] = taken[pairWith] = true;
                //경우의 수를 재귀 호출를 통해 반복해서 구한다.
                ret += countParing(taken);
                //인덱스가 재귀 호출 과정에서 변하므로 false를 할당한다.(해당 친구의 다음 짝을 계산해야 하므로)
                taken[firstFree] = taken[pairWith] = false;
            }
        }
        //계산 결과(경우의 수) 반환
        return ret;
    }
}