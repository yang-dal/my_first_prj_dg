ALTER TABLE example_table2 modify column id INT AUTO_INCREMENT;

-- (1) 문자형 데이터를 숫자형 필터링에 사용
INSERT INTO example_table2 (id, small_integer) VALUES
  (null, 10),
  (null, 20),
  (null, 30),
  (null, 40),
  (null, 50);
SELECT id, small_integer FROM example_table2 WHERE small_integer > 20;
SELECT id, small_integer FROM example_table2 WHERE small_integer > '20';  -- 괜찮음
    -- '20' -> 20 묵시적 숫자타입 변환
    -- 묵시적 형 변환이 1번만 일어남

-- (2) 숫자형 데이터를 문자열 필터링에 사용
INSERT INTO example_table2 (id, variable_length_string) VALUES
  (null, '10'),
  (null, '20'),
  (null, '30'),
  (null, '40'),
  (null, '50');
SELECT id, variable_length_string FROM example_table2 WHERE variable_length_string > 20;
-- 모든 행의 문자 데이터가 integer 타입으로 묵시적 형변환
-- cardinality 수만큼의 형변환이 일어난다.
SELECT id, variable_length_string FROM example_table2 WHERE variable_length_string > '20';
    -- 문자에 대해서 문자로 대소 비교할 때 => ASCII, 유니코드 -> 매핑 연산이 일어난다.
    -- 보이지 않는 오버헤드가 여전히 문제
    -- : 대소 비교를 할 때는, 숫자 타입으로 하는 것이 좋다
    -- => 꼭 필요한 경우! insert 할 때, 숫자컬럼을 파생컬럼으로 하나 만들어서 함께 입력한다.


-- (3) 숫자로 타입캐스팅이 불가능한 데이터를 숫자로 필터링
INSERT INTO example_table2 (id, variable_length_string) VALUES
  (null, 'Sixty'),
  (null, 'Seventy'),
  (null, 'Eighty');
INSERT INTO example_table2 (id, variable_length_string) VALUES
  (null, '90'),
  (null, '100');
SELECT id, example_table2.variable_length_string From example_table2;
SELECT id, variable_length_string FROM example_table2 WHERE variable_length_string > 60;  -- 의도치 않은 데이터 제외 : Truncated incorrect DOUBLE value: 'Three'
SELECT id, variable_length_string FROM example_table2 WHERE variable_length_string > 'Seventy'; -- 데이터 제외되지 않지만 일반적으로 의도치 않는 동작
-- => 결론 : 숫자는 반드시 숫자 타입으로 다루자.