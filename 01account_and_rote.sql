CREATE USER 'admin' IDENTIFIED BY '1234';
CREATE USER 'app_service_acc2' IDENTIFIED BY '1234';

-- private 를 부여
GRANT ALL PRIVILEGES ON *.* to 'admin';
SELECT * FROM mysql.user WHERE User = 'admin';
GRANT SELECT ON *.* to 'app_service_acc2';
SELECT * FROM mysql.user WHERE User = 'app_service_add';

-- 계정 생성 및 password 지정
CREATE USER 'admin_acc'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'developer_acc'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'readonly_acc'@'localhost' IDENTIFIED BY '1234';
SELECT * FROM mysql.user;

-- Role 생성
CREATE ROLE admin;
CREATE ROLE developer;
CREATE ROLE readonly;

-- Role에 권한 할당
GRANT ALL PRIVILEGES ON *.* TO 'admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'developer';
GRANT SELECT ON *.* TO 'readonly';