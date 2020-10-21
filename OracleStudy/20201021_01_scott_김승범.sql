--○ 과제
--   TBL_입고 테이블의 데이터 입력, 수정, 삭제 시
--   TBL_상품 테이블의 데이터 재고수량 변동 트리거 작성
--   트리거명 : TRG_IBGO

CREATE OR REPLACE TRIGGER TRG_IBGO
          AFTER
          INSERT OR UPDATE OR DELETE ON TBL_입고
          FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN  UPDATE TBL_상품
              SET 재고수량 = 재고수량 + :NEW.입고수량
              WHERE 상품코드 = :NEW.상품코드;
    ELSIF (UPDATING)
        THEN  UPDATE TBL_상품
              SET 재고수량 = 재고수량 - (:OLD.입고수량 - :NEW.입고수량)
              WHERE 상품코드 = :NEW.상품코드;
    ELSIF (DELETING)
        THEN  UPDATE TBL_상품 
              SET 재고수량 = 재고수량 - :OLD.입고수량
              WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;
--==>> Trigger TRG_IBGO이(가) 컴파일되었습니다.

--○ 과제
--   TBL_출고 테이블의 데이터 입력, 수정, 삭제 시
--   TBL_상품 테이블의 데이터 재고수량 변동 트리거 작성
--   트리거명 : TRG_CHULGO
CREATE OR REPLACE TRIGGER TRG_CHULGO
          AFTER
          INSERT OR UPDATE OR DELETE ON TBL_출고
          FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN  UPDATE TBL_상품
              SET 재고수량 = 재고수량 - :NEW.출고수량
              WHERE 상품코드 = :NEW.상품코드;
    ELSIF (UPDATING)
        THEN  UPDATE TBL_상품
              SET 재고수량 = 재고수량 + (:OLD.출고수량 - :NEW.출고수량)
              WHERE 상품코드 = :NEW.상품코드;
    ELSIF (DELETING)
        THEN  UPDATE TBL_상품 
              SET 재고수량 = 재고수량 + :OLD.출고수량
              WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;
--==>> Trigger TRG_CHULGO이(가) 컴파일되었습니다.


--○ 과제 테스트
SELECT * FROM TBL_입고;
SELECT * FROM TBL_상품;

INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
VALUES (19, 'H001', SYSDATE, 10, 400);

UPDATE TBL_입고
SET 입고수량 = 50
WHERE 입고번호 = 19;

DELETE
FROM TBL_입고
WHERE 입고번호 = 19;


SELECT * FROM TBL_출고;
SELECT * FROM TBL_상품;

INSERT INTO TBL_출고(출고번호, 상품코드, 출고일자, 출고수량, 출고단가)
VALUES (5, 'H001', SYSDATE, 5, 400);

UPDATE TBL_출고
SET 출고수량 = 6
WHERE 출고번호 = 5;

DELETE
FROM TBL_출고
WHERE 출고번호 = 5;






