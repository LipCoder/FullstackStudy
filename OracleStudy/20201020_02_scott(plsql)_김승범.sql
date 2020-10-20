--○ 과제
--   - 제출 파일 : 20201020_02_scott(plsql)_홍길동.sql
--   - 제출 내용
--   다음 프로시저를 생성한다.
--    * PRC_입고_UDPATE(입고번호, 입고수량) 
--    * PRC_입고_DELETE(입고번호)
--    * PRC_출고_DELETE(출고번호)
--    --> 이미 출고된 상황을 생각해주자.

SELECT USER
FROM DUAL;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PRC_출고_DELETE
(
    V_출고번호  IN  TBL_출고.출고번호%TYPE
)
IS
    V_상품코드  TBL_상품.상품코드%TYPE;
    V_출고수량  TBL_출고.출고수량%TYPE;
BEGIN
    SELECT 상품코드, 출고수량 INTO V_상품코드, V_출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- 상품테이블 업데이트
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    -- 출고데이터 삭제
    DELETE 
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- 커밋
    COMMIT;
    
    -- 예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_출고_DELETE이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_입고_UPDATE
(
  V_입고번호     IN  TBL_입고.입고번호%TYPE
, V_입고수량     IN  TBL_입고.입고수량%TYPE
)
IS
    V_상품코드   TBL_상품.상품코드%TYPE;
    V_재고수량   TBL_상품.재고수량%TYPE;
    
    V_기존입고수량 TBL_입고.입고수량%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT 상품코드, 입고수량 INTO V_상품코드, V_기존입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    SELECT 재고수량 INTO V_재고수량 
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드; 
    
    -- 수정된 입고수량이 기존입고수량보다 작은 경우
    -- 부족한 수량을 재고 수량으로 커버가 불가능하다면
    -- 업데이트를 할 수 없음
    IF ( V_입고수량 < V_기존입고수량
     AND (V_기존입고수량 - V_입고수량) > V_재고수량 )
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 입고 테이블 업데이트
    UPDATE TBL_입고
    SET 입고수량 = V_입고수량
    WHERE 입고번호 = V_입고번호;
    
    -- 상품 테이블 업데이트
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + (V_입고수량 - V_기존입고수량)
    WHERE 상품코드 = V_상품코드;
    
    -- 커밋
    COMMIT;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR('-20003', '입고수량 변동폭이 현재 재고수량보다 큽니다.'); 
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_입고_UPDATE이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_입고_DELETE
( 
  V_입고번호    IN  TBL_입고.입고번호%TYPE
)
IS
    V_상품코드   TBL_상품.상품코드%TYPE;
    V_재고수량   TBL_상품.재고수량%TYPE;
    V_기존입고수량 TBL_입고.입고수량%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT 상품코드, 입고수량 INTO V_상품코드, V_기존입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    SELECT 재고수량 INTO V_재고수량 
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드; 
    
    -- 삭제할 입고수량을 재고수량으로 커버가 불가능하다면
    -- 삭제할 수 없다.
    IF ( V_기존입고수량 > V_재고수량  )
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 입고 테이블 삭제
    DELETE 
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    -- 상품 테이블 업데이트
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_기존입고수량
    WHERE 상품코드 = V_상품코드;
    
    -- 커밋
    COMMIT;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR('-20004', '삭제할 수량이 현재 재고수량보다 많습니다.'); 
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_입고_DELETE이(가) 컴파일되었습니다.

