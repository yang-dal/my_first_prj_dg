CREATE TABLE example_table2 (
    id INT PRIMARY KEY,
    small_integer SMALLINT,
    large_integer BIGINT,
		birth_date DATE,
    decimal_number DECIMAL(10, 2),
    floating_point FLOAT,
    double_precision DOUBLE,
    fixed_length_string CHAR(10),
    variable_length_string VARCHAR(255),
    long_text TEXT,
    binary_data BLOB,
    long_binary_data LONGBLOB,
		json_data JSON
);

-- JSON 리터럴 데이터 추가
INSERT INTO example_table2 (id, json_data) VALUES (1, '{"name": "John", "age": 30, "arr": [10, 20, 30]}');
INSERT INTO example_table2 (id, json_data) VALUES (2, '{"name": "Jenny", "arr": [1, 2, 3]}');

SELECT json_data FROM example_table2;

-- SELECT 절에서 값 사용 (1)
SELECT json_data->>'$.name' AS name FROM example_table2 WHERE id = 1;
SELECT json_data->>'$.name' AS name FROM example_table2;

SELECT
    json_data->'$.arr',
    json_data->'$.arr[0]',
    json_data->'$.arr[1]',
    json_data->'$.arr[2]'
FROM example_table2;

-- Class -> Entity 매핑
    -- field = attribute
-- Object -> Column 매핑
    -- Object 내부 field = JSON 타입의 key

-- JSON 쿼리 시 참조 구문 2가지 비교
-- (1) '->>' 는 스칼라 값을 가져옴 (키가 없으면 NULL)
-- (2) '->' 는 반드시 JSON 타입을 가져옴 (키가 있어도 값이 JSON 타입이 아니면 NULL)

-- JSON 타입 문자와 일반 스칼라 문자는 "" 기호로 감싸지는 여부 차이
SELECT json_data->>'$.name' AS name FROM example_table2;
SELECT json_data->'$.name' AS name FROM example_table2;

-- JSON 타입 숫자와 일반 숫자는 동일함
SELECT json_data->'$.arr[0]' FROM example_table2;
SELECT json_data->>'$.arr[0]' FROM example_table2;