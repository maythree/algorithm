package maythree.Chapter6;

/**
 * H X W크기의 게임판이 있습니다. 게임판은 검은칸과 흰 칸으로 구성된 격자 모양을 하고 있는데 이 중 모든 흰 칸을
 * 세칸짜리 L자 모양의 블록으로 덮고 싶습니다. 이때 블록들은 자유롭게 회전해서 놓을 수 있지만, 서로 겹치거나, 검은 칸을 덮거나,
 * 게임판 밖으로 나가서는 안됩니다.
 * 게임판이 주어질 때 이를 덮는 방법의 수를 계산하는 프로그램을 작성하세요.
 */
public class BoardCover {

    public static int width, height;
    public static int coverType[][][] = {
            {{0, 0}, {1, 0}, {0, 1}},
            {{0, 0}, {0, 1}, {1, 1}},
            {{0, 0}, {1, 0}, {1, 1}},
            {{0, 0}, {1, 0}, {1, -1}},
    };
    public static int board[][];

    public static void main(String[] args) {
        height = 3;
        width = 7;
        board = new int[height][width];
        board[0][0] = 1;
        board[0][6] = 1;
        board[1][0] = 1;
        board[1][6] = 1;
        board[2][0] = 1;
        board[2][1] = 1;
        board[2][4] = 1;
        board[2][5] = 1;
        board[2][6] = 1;
        System.out.println(cover());

        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                System.out.print(board[i][j]);
            }
            System.out.println();
        }
    }

    public static boolean set(int y, int x, int type, int delta) {
        boolean ok = true;
        for (int i = 0; i < 3; i++) {
            int ny = y + coverType[type][i][0];
            int nx = x + coverType[type][i][1];
            if (ny < 0 || ny >= height || nx < 0 || nx >= width) {
                ok = false;
            } else if ((board[ny][nx] += delta) > 1) {
                ok = false;
            }
        }
        return ok;
    }

    public static int cover() {
        int y = -1, x = -1;
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                if (board[i][j] == 0) {
                    y = i;
                    x = j;
                    break;
                }
            }
            if (y != -1) {
                break;
            }
        }
        if (y == -1) return 1;
        int ret = 0;
        for (int type = 0; type < 4; type++) {
            if (set(y, x, type, 1)) {
                ret += cover();
            }
            set(y, x, type, -1);
        }
        return ret;
    }
}
