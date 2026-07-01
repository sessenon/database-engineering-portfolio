-- ============================================================
-- AI Movie Recommendation System
-- Relational (MySQL / TiDB Cloud Serverless)
-- ============================================================


-- ─────────────────────────────────────────
-- Create Customers table
-- ─────────────────────────────────────────

CREATE TABLE Customers (
    customer_id     INT PRIMARY KEY AUTO_INCREMENT,
    username        VARCHAR(50)  NOT NULL UNIQUE,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    age             INT,
    membership_type ENUM('Basic', 'Standard', 'Premium') DEFAULT 'Basic',
    joined_date     DATE NOT NULL
);

-- ─────────────────────────────────────────
-- Create Movies table
-- ─────────────────────────────────────────

CREATE TABLE Movies (
    movie_id         INT PRIMARY KEY AUTO_INCREMENT,
    title            VARCHAR(150) NOT NULL,
    genre            VARCHAR(50)  NOT NULL,
    release_year     INT,
    rating           DECIMAL(3,1),
    duration_min     INT,
    available_copies INT DEFAULT 1
);

-- ─────────────────────────────────────────
-- Create Rentals table
-- ─────────────────────────────────────────

CREATE TABLE Rentals (
    rental_id   INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    movie_id    INT NOT NULL,
    rental_date DATE NOT NULL,
    return_date DATE,
    status      ENUM('Active', 'Returned', 'Overdue') DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (movie_id)    REFERENCES Movies(movie_id)
);

-- ─────────────────────────────────────────
-- Insert Customers
-- ─────────────────────────────────────────

INSERT INTO Customers (username, full_name, email, age, membership_type, joined_date) VALUES
('ShadyWeah',      'Shady Weah',       'shadyweah@mail.com',    28, 'Premium',  '2023-01-15'),
('LibWest',        'Lib West',         'libwest@mail.com',       34, 'Standard', '2023-03-08'),
('DecentThaGreat', 'Decent Tha Great', 'decent@mail.com',        22, 'Basic',    '2023-06-20'),
('LightBringer',   'Light Bringer',    'lightbringer@mail.com',  30, 'Premium',  '2022-11-01'),
('TooSmooth',      'Too Smooth',       'toosmooth@mail.com',     26, 'Standard', '2024-02-14');

-- ─────────────────────────────────────────
-- Insert Movies
-- ─────────────────────────────────────────

INSERT INTO Movies (title, genre, release_year, rating, duration_min, available_copies) VALUES
('Children of Pepper Bird',   'Drama',    2019, 9.1, 145, 4),
('Monrovia After Midnight',   'Thriller', 2021, 8.2, 112, 3),
('The Loma Way',              'Drama',    2020, 8.7, 138, 2),
('Iron Mine Blues',           'Action',   2022, 7.9, 105, 5),
('Fanti Market Girl',         'Romance',  2021, 8.0, 110, 2),
('Dust on the Pepper Coast',  'Thriller', 2022, 8.4, 130, 3),
('Neon Horizons',             'Sci-Fi',   2022, 7.8, 128, 2),
('The Dark Frequency',        'Thriller', 2023, 7.5,  98, 1),
('Grebo Sunrise',             'Romance',  2020, 8.3, 120, 3),
('Last Signal from Buchanan', 'Sci-Fi',   2023, 7.2, 115, 4);

-- ─────────────────────────────────────────
-- Insert Rentals
-- ─────────────────────────────────────────

INSERT INTO Rentals (customer_id, movie_id, rental_date, return_date, status) VALUES
(1, 1,  '2026-05-01', '2026-05-04', 'Returned'),
(1, 3,  '2026-05-10', '2026-05-13', 'Returned'),
(1, 6,  '2026-06-01', NULL,         'Active'),
(2, 2,  '2026-05-15', '2026-05-18', 'Returned'),
(2, 7,  '2026-06-05', NULL,         'Active'),
(3, 4,  '2026-05-20', '2026-05-22', 'Returned'),
(3, 9,  '2026-06-10', NULL,         'Active'),
(4, 3,  '2026-04-28', '2026-05-01', 'Returned'),
(4, 8,  '2026-06-12', NULL,         'Active'),
(5, 5,  '2026-06-08', NULL,         'Active'),
(5, 10, '2026-05-25', '2026-05-28', 'Returned'),
(1, 8,  '2026-06-15', NULL,         'Active');

-- ─────────────────────────────────────────
-- Verify row counts
-- ─────────────────────────────────────────

SELECT 'Customers' AS table_name, COUNT(*) AS row_count FROM Customers
UNION ALL
SELECT 'Movies',  COUNT(*) FROM Movies
UNION ALL
SELECT 'Rentals', COUNT(*) FROM Rentals;

-- ─────────────────────────────────────────
-- ShadyWeah's full rental history
-- ─────────────────────────────────────────

SELECT
    c.username,
    m.title,
    m.genre,
    r.rental_date,
    r.return_date,
    r.status
FROM Rentals r
JOIN Customers c ON r.customer_id = c.customer_id
JOIN Movies    m ON r.movie_id    = m.movie_id
WHERE c.username = 'ShadyWeah'
ORDER BY r.rental_date DESC;

-- ─────────────────────────────────────────
-- Most rented genres
-- ─────────────────────────────────────────

SELECT
    m.genre,
    COUNT(r.rental_id)      AS total_rentals,
    ROUND(AVG(m.rating), 2) AS avg_movie_rating
FROM Rentals r
JOIN Movies m ON r.movie_id = m.movie_id
GROUP BY m.genre
ORDER BY total_rentals DESC;

-- ─────────────────────────────────────────
-- Premium members with active rentals
-- ─────────────────────────────────────────

SELECT
    c.username,
    c.membership_type,
    COUNT(r.rental_id) AS active_rentals
FROM Customers c
JOIN Rentals r ON c.customer_id = r.customer_id
WHERE c.membership_type = 'Premium'
  AND r.status = 'Active'
GROUP BY c.customer_id, c.username, c.membership_type;

-- ─────────────────────────────────────────
-- Movies never rented (cold-start)
-- ─────────────────────────────────────────

SELECT
    m.movie_id,
    m.title,
    m.genre,
    m.rating
FROM Movies m
LEFT JOIN Rentals r ON m.movie_id = r.movie_id
WHERE r.rental_id IS NULL;

-- ─────────────────────────────────────────
-- Customer rental frequency ranking
-- ─────────────────────────────────────────

SELECT
    c.username,
    c.membership_type,
    COUNT(r.rental_id) AS total_rentals,
    MIN(r.rental_date) AS first_rental,
    MAX(r.rental_date) AS latest_rental
FROM Customers c
JOIN Rentals r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.username, c.membership_type
ORDER BY total_rentals DESC;

-- ─────────────────────────────────────────
-- Available Thriller movies ranked by rating
-- ─────────────────────────────────────────

SELECT
    movie_id,
    title,
    release_year,
    rating,
    available_copies
FROM Movies
WHERE genre = 'Thriller'
  AND available_copies > 0
ORDER BY rating DESC;
