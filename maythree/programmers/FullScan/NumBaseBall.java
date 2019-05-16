package programmers.FullScan;

public class NumBaseBall {

    public static void main(String[] args) {
        int[][] baseball = {{123, 1, 1}, {356,1,0}, {327, 2, 0}, {489,0, 1}};
        solution(baseball);
    }

    public static int solution(int[][] baseball) {
        int answer = 0;
        for(int count=123; count<=987; count++) {
            BaseBallCount baseBallCount = new BaseBallCount(count/100, count/10%10, count%10);
            if(!baseBallCount.valid()) {
                continue;
            }
            boolean isCorrect = true;
            for(int index =0; index< baseball.length; index++) {
                if(!isCorrect(baseBallCount, baseball[index])) {
                    isCorrect = false;
                    break;
                }
            }
            if(isCorrect) {
                System.out.println(count);
                answer++;
            }
        }
        return answer;
    }

    public static boolean isCorrect(BaseBallCount baseBallCount, int[] question) {
        int qNumber = question[0];
        int qStrikeCount = question[1];
        int qBallCount = question[2];

        BaseBallCount qBaseBallCount = new BaseBallCount(qNumber/100, qNumber/10%10, qNumber%10);
        int strikeCount = getStrikeCount(baseBallCount, qBaseBallCount);
        if(strikeCount == qStrikeCount) {
            int ballCount = getBallCount(baseBallCount, qBaseBallCount);
            if(ballCount == qBallCount) {
                return true;
            }
        }
        return false;
    }

    public static int getStrikeCount(BaseBallCount baseBallCount, BaseBallCount qBaseBallCount) {
        int strikeCount = 0;
        if(baseBallCount.num1 == qBaseBallCount.num1) {
            strikeCount++;
        }
        if(baseBallCount.num2 == qBaseBallCount.num2) {
            strikeCount++;
        }
        if(baseBallCount.num3 == qBaseBallCount.num3) {
            strikeCount++;
        }
        return strikeCount;
    }

    public static int getBallCount(BaseBallCount baseBallCount, BaseBallCount qBaseBallCount) {
        int ballCount = 0;
        if(baseBallCount.num1 == qBaseBallCount.num2 || baseBallCount.num1 == qBaseBallCount.num3) {
            ballCount++;
        }
        if(baseBallCount.num2 == qBaseBallCount.num1 || baseBallCount.num2 == qBaseBallCount.num3) {
            ballCount++;
        }
        if(baseBallCount.num3 == qBaseBallCount.num1 || baseBallCount.num3 == qBaseBallCount.num2) {
            ballCount++;
        }
        return ballCount;
    }

    public static class BaseBallCount {
        int num1;
        int num2;
        int num3;

        public BaseBallCount(int num1, int num2, int num3) {
            this.num1 = num1;
            this.num2 = num2;
            this.num3 = num3;
        }

        public boolean valid() {
            if(this.num1 == 0 || this.num2 == 0 || this.num3 ==0) {
                return false;
            }
            if(this.num1 == this.num2 || this.num2 == this.num3 || this.num3 == this.num1) {
                return false;
            }
            return true;
        }
    }
}
