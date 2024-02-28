-- 1. 데이터베이스 생성 및 선택
create database pokemon_game;
use pokemon_game;
-- 2. 테이블 정의, 물리 스키마 설계
DROP TABLE pokemon;
DROP TABLE pokemon_trainer;
DROP TABLE poke_dex;
DROP TABLE pokemon_skills;
DROP TABLE battle_result;
-- ----------------------
-- (1) 포켓몬 기술 스키마
-- ----------------------
DROP TABLE IF EXISTS pokemon_skills;
CREATE TABLE pokemon_skills (
    id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(20) NOT NULL,
    skill_effect VARCHAR(20) NOT NULL,
    skill_type VARCHAR(10) NOT NULL,
    skill_damage VARCHAR(10) NOT NULL
);
-- ----------------------
-- (2) 포켓몬 도감 스키마
-- ----------------------
DROP TABLE IF EXISTS poke_dex;
CREATE TABLE poke_dex (
    monster_id INT PRIMARY KEY,
    monster_name VARCHAR(10) NOT NULL,
    monster_type VARCHAR(10) NOT NULL,
    max_hp INT NOT NULL,
    evolution_stage INT DEFAULT 1 NOT NULL,
    evolves_from INT NULL,
    is_legendary BOOL DEFAULT FALSE,
    INDEX idx_monstertype (monster_type),
    FOREIGN KEY fk_evolvesfrom (evolves_from) REFERENCES poke_dex (monster_id),
    CONSTRAINT evolutiontage_range check ( evolution_stage BETWEEN 1 AND 3 )
);
-- ----------------------
-- (3) 트레이너 스키마
-- ----------------------
DROP TABLE IF EXISTS pokemon_trainer;
CREATE TABLE pokemon_trainer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    trainer_type VARCHAR(20),
    FOREIGN KEY fk_trainertype_monstertype (trainer_type) REFERENCES poke_dex (monster_type)
);
-- ----------------------
-- (4) 포켓몬 스키마
-- ----------------------
DROP TABLE IF EXISTS pokemon;
CREATE TABLE pokemon (
    id INT PRIMARY KEY AUTO_INCREMENT,
    monster_id INT NOT NULL,
    skill1 INT NOT NULL,
    skill2 INT NULL,
    owner INT NULL,
    nickname VARCHAR(20) NOT NULL,
    hp INT NOT NULL,
    is_surfable BOOLEAN DEFAULT FALSE,
    is_flyable BOOLEAN DEFAULT FALSE,
    FOREIGN KEY fk_monsterid2 (monster_id) references poke_dex (monster_id),
    FOREIGN KEY fk_pokemon_skill1 (skill1) REFERENCES pokemon_skills (id),
    FOREIGN KEY fk_pokemon_skill2 (skill2) REFERENCES pokemon_skills (id),
    FOREIGN KEY fk_pokemon_trainer (owner) REFERENCES pokemon_trainer (id)
);
-- ----------------------
-- (5) 전투결과 스키마
-- ----------------------
DROP TABLE IF EXISTS battle_result;
CREATE TABLE battle_result (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pokemon_id_1 INT NOT NULL,
    pokemon_id_2 INT NOT NULL,
    winner_id INT NULL,
    result_memo VARCHAR(50)
);