show databases;
create database syu_camp DEFAULT CHARACTER SET utf8mb4; -- emogi 등 지원되는 문자셋의 범위가 크다
use syu_camp;
use my_first_db;
show tables;
use mysql;
show tables;

-- 연된된 프로젝트에
-- 로그인 계정이 아닌, user 계정 (로그인 없이 특정 리소스를 직접 호출 가능) => 데이터 베이스를 안전하게 불필요한 고수준의 DDL 권한 없이 접근하도록 함
-- DDL : Data Definition Language
-- DML : Data Modification Language
-- 프로그램 App 에서 DB 에 접속할 때 사용하는 계정은 user 계정으로, DML 에 대한 권한을 가지는 경우가 많다.

SELECT @sql-mode;
-- ONLY_FULL_GROUP_BY
-- STRICT_TRANS_TABLES. -- 데이터 타입 캐스팅 strong / weak
-- NO_ZERO_IN_DATE
-- NO_ZERO_DATE
-- ERROR_FOR_DIVISION_BY_ZERO
-- NO_ENGINE_SUBSITUTION -- 엔진 지정하지 않은 경우 알아서 대체해주는 동작 여부 설정

