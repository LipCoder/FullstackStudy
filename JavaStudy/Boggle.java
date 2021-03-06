import java.util.Scanner;

public class Boggle {
    
	static final int[] dx = { -1, -1, -1,  1,  1,  1,  0,  0 };
	static final int[] dy = { -1,  0,  1, -1,  0,  1, -1,  1 };

	static char[][] board = new char[5][5];

	// 5x5 보글 게임 판에 해당 위치에서 주어진 단어가 시작하는지를 반환
	static boolean hasWord(int y, int x, String word) {
    
    // 기저사례 1 : 시작 위치가 밖이면 무조건 실패
	if(!inRange(y, x)) return false;
    
    // 기저사례 2 : 첫 글자가 일치하지 않으면 실패
	if(board[y][x] != word.charAt(0)) return false;
    
    // 기저사례 3 : 단어 길이가 1이면 성공
	if(word.length() == 1) return true;
    
    // 인접한 여덟 칸을 검사한다. 
	for(int direction = 0; direction < 8; ++direction) {
		int nextY = y + dy[direction];
		int nextX = x + dx[direction];
		// 다음 칸이 범위 안에 있는지, 첫 글자는 일치하는지 확인할 필요가 없다.
		if(hasWord(nextY, nextX, word.substring(1)))
			return true;
		}
		return false;
	}

	static boolean inRange(int y, int x) {
		return (x >= 0 && x < 5) && (y >= 0 && y < 5);
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		// board판 입력
		for(int i = 0; i < 5; ++i) {
			String tmpStr = sc.next();
			for(int j = 0; j < 5; ++j) {
				board[i][j] = tmpStr.charAt(j);
			}
		}

		// 확인할 단어 수 입력
		int testCount = sc.nextInt();
		String[] str = new String[testCount];
		
		// 단어 입력
		for(int i = 0 ; i < str.length; ++i) {
			str[i] = sc.next();
		}

		for(int n = 0; n < str.length; ++n) {
			System.out.print(str[n] + " ");
			boolean isWord = false;
			
			for(int i = 0; i < 5; ++i) {
				for(int j = 0; j < 5; ++j) {
					if(hasWord(i, j, str[n])) {
						isWord = true;
						break;
					}
				}
				if(isWord) break;
			}

			if(isWord) System.out.println("YES");
			else  System.out.println("NO");
		}

	}
}