CREATE TABLE board_user
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    location VARCHAR(10) NOT NULL
);
SELECT * FROM board_user;
CREATE TABLE post
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    board_user_id INT,
    posted_at     DATETIME DEFAULT NOW(),
    CONTENT       VARCHAR(255)
);
SELECT * FROM post;

INSERT INTO board_user (username, location) VALUES
  ('sorbet0231', '서울'),
  ('landia92', '서울'),
  ('sungwoo7180', '울산'),
  ('msak1234', '런던'),
  ('yuop1022', '로마'),
  ('nucon84', '로마');
INSERT INTO post (board_user_id, CONTENT) VALUES
  (1, '안녕하세요 반갑습니다.'),
  (2, '저는 2번 유저입니다.'),
  (3, '일기입니다.'),
  (4, '방명록입니다.'),
  (5, '이것은 오늘 아침 뉴스 요약입니다.'),
  (2, '오늘의 날씨 안내합니다.'),
  (4, '오늘의 교통정보입니다.'),
  (5, '즐거운 주말 보내세요'),
  (1, '아직 화요일 입니다.'),
  (2, '곧 개강입니다.');
SELECT * FROM post;

SELECT *
FROM board_user
INNER JOIN post p
ON board_user.id = p.board_user_id;

SELECT *
FROM board_user
LEFT JOIN post p
ON board_user.id = p.board_user_id;

INSERT INTO post (board_user_id, CONTENT) VALUES
  (10, '안녕하세요 반갑습니다. 10번 입니다.'),
  (15, '저는 15번 유저입니다.');

SELECT *
FROM board_user
RIGHT JOIN post p
ON board_user.id = p.board_user_id;

-- MySQL 에서는 FULL OUTER JOIN 지원 안함
-- UNION 집합연산을 사여ㅛㅇ해서 FULL OUTER JOIN 구현 가능

-- NATURAL JOIN
-- 동일한 목적의 테이블인데, 컬럼 구성이 다소 다른 테이블
CREATE TABLE private_info1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    age INT
    -- 등등 ~~
);
CREATE TABLE private_info2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    address VARCHAR(50)
);
INSERT INTO private_info1 (name, age) VALUES
    ('user1', 10),
    ('user2', 11),
    ('user3', 12),
    ('user4', 15),
    ('user5', 20),
    ('user6', 21),
    ('user7', 30),
    ('user8', 35),
    ('user9', 50),
    ('user10', 99);
INSERT INTO private_info2 (name, address) VALUES
    ('user1', 'my home'),
    ('user2', 'my office'),
    ('user3', 'my hotel'),
    ('user4', 'my apt'),
    ('user5', 'my yard'),
    ('user6', 'my sky'),
    ('user7', 'my seoul'),
    ('user8', 'my back ground'),
    ('user9', 'my playground'),
    ('user10', 'nowhere');

-- 매우 암묵적으로 연결되는 JOIN 방식
SELECT * FROM private_info1
NATURAL JOIN private_info2;

CREATE TABLE private_info3 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    insurance_registered boolean
);
INSERT INTO private_info3 (name, insurance_registered) VALUES
    ('user1', TRUE),
    ('user2', TRUE),
    ('user3', TRUE),
    ('user4', TRUE),
    ('user5', TRUE),
    ('user6', FALSE),
    ('user7', FALSE),
    ('user8', FALSE),
    ('user9', FALSE),
    ('user10', FALSE);

SELECT * FROM private_info1
NATURAL JOIN private_info3;

SELECT *
FROM private_info1 AS p1
INNER JOIN private_info3 AS p3
ON p1.name = p3.name;