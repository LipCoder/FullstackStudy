import java.util.Scanner;

public class Boggle {
    
	static final int[] dx = { -1, -1, -1,  1,  1,  1,  0,  0 };
	static final int[] dy = { -1,  0,  1, -1,  0,  1, -1,  1 };

	static char[][] board = new char[5][5];

	// 5x5 ���� ���� �ǿ� �ش� ��ġ���� �־��� �ܾ �����ϴ����� ��ȯ
	static boolean hasWord(int y, int x, String word) {
    
    // ������� 1 : ���� ��ġ�� ���̸� ������ ����
	if(!inRange(y, x)) return false;
    
    // ������� 2 : ù ���ڰ� ��ġ���� ������ ����
	if(board[y][x] != word.charAt(0)) return false;
    
    // ������� 3 : �ܾ� ���̰� 1�̸� ����
	if(word.length() == 1) return true;
    
    // ������ ���� ĭ�� �˻��Ѵ�. 
	for(int direction = 0; direction < 8; ++direction) {
		int nextY = y + dy[direction];
		int nextX = x + dx[direction];
		// ���� ĭ�� ���� �ȿ� �ִ���, ù ���ڴ� ��ġ�ϴ��� Ȯ���� �ʿ䰡 ����.
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
		
		// board�� �Է�
		for(int i = 0; i < 5; ++i) {
			String tmpStr = sc.next();
			for(int j = 0; j < 5; ++j) {
				board[i][j] = tmpStr.charAt(j);
			}
		}

		// Ȯ���� �ܾ� �� �Է�
		int testCount = sc.nextInt();
		String[] str = new String[testCount];
		
		// �ܾ� �Է�
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