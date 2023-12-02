SELECT *
FROM item;

-- item 테이블에 상품을 추가한다.
INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('초코초코초코초코초코', '초코파이', '0', '2024-10-30', 7290, 100, '과자');

-- item_name의 길이가 30자를 초과하면 입력이 되지 않는다.
-- [22001][1406] (conn=194) Data too long for column 'name' at row 1
INSERT INTO item (description, name, item_type, cost_price, grade, category)
VALUES ('잘풀리는집 클래식 25m 6롤을 사용하면 3달은 거뜬해요', '잘풀리는집 클래식 25m 6롤 잘풀리는집 클래식 25m 6롤', '2', 4990, 50, '생활');
-- name의 길이에 맞게 입력하면 INSERT에 성공한다.
INSERT INTO item (description, name, item_type, cost_price, grade, category)
VALUES ('잘풀리는집 클래식 25m 6롤을 사용하면 3달은 거뜬해요', '잘풀리는집 클래식 25m 6롤', '2', 4990, 50, '생활');

-- item_type에 값을 넣지 않으면 기본 값으로 0이 입력된다.
INSERT INTO item (description, name, expire_date, cost_price, grade, category)
VALUES ('초코초코', '메론맛 초코파이', '2024-10-30', 7290, 30, '과자');

-- cost_price에 음수를 넣는다면 INSERT에 실패한다(구현 안됨)
# INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
# VALUES ('좋은 재료의 기본을 지키는 북창동 순두부', '북창동 소고기 순두부찌개 620g', '1', '2025-12-01', -10990, 98, '국·탕·찌개');

-- cost_price에 값이 없다면 NULL이 입력된다.
INSERT INTO item (description, name, item_type, expire_date, grade, category)
VALUES ('좋은 재료의 기본을 지키는 북창동 순두부', '북창동 소고기 순두부찌개 620g', '1', '2025-12-01', 98, '국·탕·찌개');

-- grade에 tinyint의 범위(-128에서 127까지)를 초과하는 값을 입력될 경우 insert에 실패한다.
-- [22003][1264] (conn=194) Out of range value for column 'grade' at row 1
-- 실패
INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('열은 내리고 갈증은 푸는 시원한 한 모금', '[2개 묶음] 웅진 하늘보리 1.5L', '0', '2024-12-02', 2380, 128, '음료·커피·생수');
-- 실패
INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('열은 내리고 갈증은 푸는 시원한 한 모금', '[2개 묶음] 웅진 하늘보리 1.5L', '0', '2024-12-02', 2380, -129, '음료·커피·생수');
-- 성공
INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('열은 내리고 갈증은 푸는 시원한 한 모금', '[2개 묶음] 웅진 하늘보리 1.5L', '0', '2024-12-02', 2380, 127, '음료·커피·생수');
-- 성공
INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('열은 내리고 갈증은 푸는 시원한 한 모금', '[2개 묶음] 웅진 하늘보리 1.5L', '0', '2024-12-02', 2380, -128, '음료·커피·생수');

-- grade에 값을 입력하지 않는다면 0이 입력된다.
INSERT INTO item (description, name, item_type, expire_date, cost_price, category)
VALUES ('짜릿함은 그대로, 칼로리 걱정은 제로!', '[4개 묶음] 펩시 제로 슈거 라임향 500ml', '0', '2024-08-30', 7560, '음료·커피·생수');

-- category에 50자가 넘는 카테고리명을 입력하면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'category' at row 1
INSERT INTO item (description, name, item_type, expire_date, cost_price, category)
VALUES ('배민보다는 SSG닷컴', 'SSG', '0', '2024-08-30', 7560,'랄라난난난난나나나
랄라랄라랄랄라
랄랄랄랄랄(랄랄라~)라
난난난난나
난나난나난나난난나

해피해피해피 맑은 날~
우리 가족 손잡고
함께 가요 이마~트(이마트~)
행복해요 이마~트
해피해피해피 이마트

이마↗트~');
