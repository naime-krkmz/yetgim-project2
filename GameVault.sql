-- 1) DEVELOPERS TABLOSU

CREATE TABLE developers (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(120) NOT NULL,
    country VARCHAR(60),
    founded_year INT
);

-- 2) GAMES TABLOSU

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    price NUMERIC(10,2),
    release_date DATE,
    rating NUMERIC(3,1),
    developer_id INT,
    CONSTRAINT fk_dev
        FOREIGN KEY (developer_id)
        REFERENCES developers(id)
        ON DELETE CASCADE
);

-- 3) GENRES TABLOSU

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    description VARCHAR(255)
);

-- 4) ARA TABLO (GAMES_GENRES)

CREATE TABLE games_genres (
    id SERIAL PRIMARY KEY,
    game_id INT,
    genre_id INT,
    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_genre
        FOREIGN KEY (genre_id)
        REFERENCES genres(id)
        ON DELETE CASCADE
);

-- VERİ EKLEME (INSERT)

INSERT INTO developers (company_name, country, founded_year) VALUES
('Naughty Dog', 'USA', 1984),
('FromSoftware', 'Japan', 1986),
('Remedy Entertainment', 'Finland', 1995),
('Bioware', 'Canada', 1995),
('Kojima Productions', 'Japan', 2015);

INSERT INTO genres (name, description) VALUES
('Action', 'Fast paced combat and movement'),
('RPG', 'Role playing adventure'),
('Survival', 'Resource and life management'),
('Shooter', 'Gun-based combat'),
('Adventure', 'Story-focused exploration');

INSERT INTO games (title, price, release_date, rating, developer_id) VALUES
('The Last Hope', 1099.99, '2019-06-21', 9.4, 1),
('Silent Valley', 799.50, '2017-10-11', 8.7, 3),
('Dragonborn Age', 699.99, '2014-03-05', 9.1, 4),
('Metal Gear Zero', 999.99, '2021-11-19', 9.0, 5),
('Shadow Street', 599.00, '2016-08-09', 8.4, 3),
('Elden Shadow', 1199.50, '2022-02-25', 9.7, 2),
('Beyond Earth', 499.99, '2013-09-10', 7.9, 4),
('Horizon West', 749.00, '2020-06-18', 8.8, 1),
('Cold Duty', 299.99, '2012-11-15', 8.6, 2),
('War of Titans', 899.99, '2023-05-06', 9.2, 5);

INSERT INTO games_genres (game_id, genre_id) VALUES
(1, 1), (1, 5),
(2, 3),
(3, 2),
(4, 1), (4, 4),
(5, 3),
(6, 1), (6, 2),
(7, 2),
(8, 1), (8, 5),
(9, 4),
(10, 1), (10, 4);

-- UPDATE : %10 İNDİRİM

UPDATE games
SET price = price * 0.9;

-- UPDATE : Rating değiştirme

UPDATE games
SET rating = 9.5
WHERE title = 'Silent Valley';

-- DELETE : Bir oyun silme

-- Önce ara tablodan
DELETE FROM games_genres
WHERE game_id = 7;

-- Sonra oyun tablosundan
DELETE FROM games
WHERE id = 7;

-- RAPORLAMA SORGULARI

-- Tüm oyunlar + fiyat + geliştirici
SELECT g.title, g.price, d.company_name
FROM games g
JOIN developers d ON g.developer_id = d.id;

-- Sadece RPG türü oyunlar
SELECT g.title, g.rating
FROM games g
JOIN games_genres gg ON g.id = gg.game_id
JOIN genres gr ON gg.genre_id = gr.id
WHERE gr.name = 'RPG';

-- 500 üstü oyunlar (pahalıdan ucuza)
SELECT title, price
FROM games
WHERE price > 500
ORDER BY price DESC;

-- İçinde "War" kelimesi geçen oyunlar
SELECT title
FROM games
WHERE title LIKE '%War%';



