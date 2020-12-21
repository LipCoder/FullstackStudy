SELECT USER
FROM DUAL;
--==>> SYS

--■■■ 오라클_암호화복호화_01_sys.sql ■■■--
/*
1. 오라클 암호화 기능을 사용하기 위해서는
   『DBMS_OBFUSCATION_TOOLKIT』 패키지를 이용한다.
   암호화, 복호화 알고리즘을 직접 구현하는 것도 가능하다.
   하지만, 편의상 오라클에서 제공해주는 패키지를 통해 구현할 수 있도록 한다.
   
2. 『DBMS_OBFUSCATION_TOOLKIT』 패키지는
   기본적으로 사용할 수 없는 상태로 설정되어 있다. (DEFAULT 설정 상...)
   이 패키지를 사용하기 위해서는 해당 패키지에 대한 추가 설치 과정이 필요하다.
   (dbmsobtk.sql, prvtobtk.plb 파일을 찾아서 실행할 수 있도록 한다.)
   
3. 이 패키지는 4개의 프로시저로 이루어져 있다.
   VARCHAR2 타입을 Encrypt/Decrypt 할 수 있는 2개의 프로시저
   RAW 타입을 Encrypt/Decrypt 할 수 있는 2개의 프로시저
   (다른 타입은 지원하지 않기 때문에 NUMBER 인 경우는 TO_CHAR 사용)
   
   ※ RAW, LONG RAW, ROWID 타입
      그래픽 IMAGE 나 디지털 SOUND 를 저장
      HEXA_DECEMAL(16진수) 형태로 RETURN
      RAW 는 VARCHAR2 와 유사
      LONG RAW 는 LONG 과 유사하나 다음과 같은 제한사항이 있다.
      ·저장과 추출만 가능하고, DATA 를 가공할 수 없다.
      ·LONG RAW 는 LONG 과 같은 제한 사항을 갖는다.
      
*/

--○ 암호화 패키지 설치
@E:\oracleexe\app\oracle\product\11.2.0\server\rdbms\admin\dbmsobtk.sql
@E:\oracleexe\app\oracle\product\11.2.0\server\rdbms\admin\prvtobtk.plb
--==>>
/*
Library DBMS_OBFUSCATION_LIB이(가) 컴파일되었습니다.
Library CRYPTO_TOOLKIT_LIBRARY이(가) 컴파일되었습니다.
Package DBMS_CRYPTO이(가) 컴파일되었습니다.
SYNONYM DBMS_CRYPTO이(가) 생성되었습니다.
Package DBMS_OBFUSCATION_TOOLKIT이(가) 컴파일되었습니다.
SYNONYM DBMS_OBFUSCATION_TOOLKIT이(가) 생성되었습니다.
Grant을(를) 성공했습니다.
Package DBMS_SQLHASH이(가) 컴파일되었습니다.
SYNONYM DBMS_SQLHASH이(가) 생성되었습니다.
Package DBMS_CRYPTO_FFI이(가) 컴파일되었습니다.
Package Body DBMS_CRYPTO_FFI이(가) 컴파일되었습니다.
Package Body DBMS_CRYPTO이(가) 컴파일되었습니다.
Package DBMS_OBFUSCATION_TOOLKIT_FFI이(가) 컴파일되었습니다.
Package Body DBMS_OBFUSCATION_TOOLKIT_FFI이(가) 컴파일되었습니다.
Package Body DBMS_OBFUSCATION_TOOLKIT이(가) 컴파일되었습니다.
Package Body DBMS_SQLHASH이(가) 컴파일되었습니다.

*/


--○ 권한 부여
--   → SCOTT 사용자 계정이 이 패키지를 사용할 수 있도록 처리
GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO SCOTT;
--==>> Grant을(를) 성공했습니다.







