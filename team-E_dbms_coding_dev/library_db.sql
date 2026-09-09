-- =========================================================
-- LIBRARY LENDING SYSTEM
-- MySQL 8.0+
-- =========================================================


-- =========================================================
-- 1. CREATE DATABASE
-- =========================================================

CREATE DATABASE IF NOT EXISTS library_db;

USE library_db;


-- =========================================================
-- 2. BOOKS TABLE
-- =========================================================

CREATE TABLE books (
    book_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255),
    publication_year INT,
    category VARCHAR(100),

    CONSTRAINT chk_publication_year
        CHECK (publication_year IS NULL OR publication_year > 0)
);


-- =========================================================
-- 3. MEMBERS TABLE
-- =========================================================

CREATE TABLE members (
    member_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    address VARCHAR(500),
    phone VARCHAR(20),
    email VARCHAR(255) UNIQUE,
    membership_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);


-- =========================================================
-- 4. LIBRARIANS TABLE
-- =========================================================

CREATE TABLE librarians (
    librarian_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    hire_date DATE NOT NULL
);


-- =========================================================
-- 5. BOOK COPIES TABLE
-- =========================================================

CREATE TABLE book_copies (
    copy_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    book_id BIGINT NOT NULL,

    status ENUM(
        'AVAILABLE',
        'BORROWED',
        'LOST',
        'DAMAGED'
    ) NOT NULL DEFAULT 'AVAILABLE',

    CONSTRAINT fk_copy_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id)
        ON DELETE RESTRICT
);


-- =========================================================
-- 6. LOANS TABLE
-- =========================================================

CREATE TABLE loans (
    loan_id BIGINT AUTO_INCREMENT PRIMARY KEY,

    copy_id BIGINT NOT NULL,
    member_id BIGINT NOT NULL,

    issued_by BIGINT NOT NULL,
    received_by BIGINT NULL,

    borrow_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    due_date DATE NOT NULL,
    return_date DATE NULL,

    status ENUM(
        'BORROWED',
        'RETURNED',
        'OVERDUE'
    ) NOT NULL DEFAULT 'BORROWED',

    CONSTRAINT fk_loan_copy
        FOREIGN KEY (copy_id)
        REFERENCES book_copies(copy_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_loan_member
        FOREIGN KEY (member_id)
        REFERENCES members(member_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_loan_issued_by
        FOREIGN KEY (issued_by)
        REFERENCES librarians(librarian_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_loan_received_by
        FOREIGN KEY (received_by)
        REFERENCES librarians(librarian_id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_due_date
        CHECK (due_date >= borrow_date),

    CONSTRAINT chk_return_date
        CHECK (
            return_date IS NULL
            OR return_date >= borrow_date
        )
);


-- =========================================================
-- 7. INDEXES
-- =========================================================

CREATE INDEX idx_book_copies_book_id
ON book_copies(book_id);

CREATE INDEX idx_book_copies_status
ON book_copies(status);

CREATE INDEX idx_loans_member_id
ON loans(member_id);

CREATE INDEX idx_loans_copy_id
ON loans(copy_id);

CREATE INDEX idx_loans_due_date
ON loans(due_date);


-- =========================================================
-- 8. SAMPLE BOOKS
-- =========================================================

INSERT INTO books
(
    isbn,
    title,
    author,
    publisher,
    publication_year,
    category
)
VALUES
(
    '9780132350884',
    'Clean Code',
    'Robert C. Martin',
    'Prentice Hall',
    2008,
    'Programming'
),
(
    '9780134685991',
    'Effective Java',
    'Joshua Bloch',
    'Addison-Wesley',
    2018,
    'Programming'
),
(
    '9781617294945',
    'Spring in Action',
    'Craig Walls',
    'Manning',
    2022,
    'Programming'
),
(
    '9781492052203',
    'Designing Data-Intensive Applications',
    'Martin Kleppmann',
    'O''Reilly',
    2017,
    'Distributed Systems'
),
(
    '9780131103627',
    'The C Programming Language',
    'Brian Kernighan',
    'Prentice Hall',
    1988,
    'Programming'
);


-- =========================================================
-- 9. SAMPLE MEMBERS
-- =========================================================

INSERT INTO members
(
    first_name,
    last_name,
    address,
    phone,
    email
)
VALUES
(
    'Rahul',
    'Kumar',
    'Vijayawada',
    '9876543210',
    'rahul@example.com'
),
(
    'Arjun',
    'Reddy',
    'Guntur',
    '9876543211',
    'arjun@example.com'
),
(
    'Priya',
    'Sharma',
    'Mangalagiri',
    '9876543212',
    'priya@example.com'
),
(
    'Anil',
    'Verma',
    'Amaravati',
    '9876543213',
    'anil@example.com'
),
(
    'Sneha',
    'Patel',
    'Vijayawada',
    '9876543214',
    'sneha@example.com'
);


-- =========================================================
-- 10. SAMPLE LIBRARIANS
-- =========================================================

INSERT INTO librarians
(
    name,
    email,
    hire_date
)
VALUES
(
    'John Smith',
    'john@library.com',
    '2023-01-15'
),
(
    'Mary Johnson',
    'mary@library.com',
    '2024-03-10'
);


-- =========================================================
-- 11. SAMPLE BOOK COPIES
-- =========================================================

-- Clean Code -> 3 copies

INSERT INTO book_copies
(book_id, status)
VALUES
(1, 'AVAILABLE'),
(1, 'AVAILABLE'),
(1, 'AVAILABLE');


-- Effective Java -> 2 copies

INSERT INTO book_copies
(book_id, status)
VALUES
(2, 'AVAILABLE'),
(2, 'AVAILABLE');


-- Spring in Action -> 2 copies

INSERT INTO book_copies
(book_id, status)
VALUES
(3, 'AVAILABLE'),
(3, 'AVAILABLE');


-- DDIA -> 2 copies

INSERT INTO book_copies
(book_id, status)
VALUES
(4, 'AVAILABLE'),
(4, 'AVAILABLE');


-- C Programming -> 1 copy

INSERT INTO book_copies
(book_id, status)
VALUES
(5, 'AVAILABLE');


-- =========================================================
-- 12. VIEW TABLES
-- =========================================================

SELECT * FROM books;

SELECT * FROM members;

SELECT * FROM librarians;

SELECT * FROM book_copies;

SELECT * FROM loans;


-- =========================================================
-- 13. ISSUE A BOOK
-- =========================================================

START TRANSACTION;

-- Lock an available physical copy.
-- Replace 1 with the required book_id.

SELECT copy_id
FROM book_copies
WHERE book_id = 1
  AND status = 'AVAILABLE'
LIMIT 1
FOR UPDATE;


-- Suppose the selected copy_id is 1.

INSERT INTO loans
(
    copy_id,
    member_id,
    issued_by,
    borrow_date,
    due_date,
    status
)
VALUES
(
    1,
    1,
    1,
    CURRENT_DATE,
    DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY),
    'BORROWED'
);


UPDATE book_copies
SET status = 'BORROWED'
WHERE copy_id = 1;

COMMIT;


-- =========================================================
-- 14. RETURN A BOOK
-- =========================================================

START TRANSACTION;


UPDATE loans
SET
    return_date = CURRENT_DATE,
    status = 'RETURNED',
    received_by = 2
WHERE loan_id = 1
  AND return_date IS NULL;


UPDATE book_copies
SET status = 'AVAILABLE'
WHERE copy_id = (
    SELECT copy_id
    FROM loans
    WHERE loan_id = 1
);


COMMIT;


-- =========================================================
-- 15. FIND OVERDUE BOOKS
-- =========================================================

SELECT
    l.loan_id,
    b.title,
    bc.copy_id,
    m.member_id,
    m.first_name,
    m.last_name,
    l.borrow_date,
    l.due_date,
    DATEDIFF(CURRENT_DATE, l.due_date) AS days_overdue
FROM loans l
JOIN book_copies bc
    ON l.copy_id = bc.copy_id
JOIN books b
    ON bc.book_id = b.book_id
JOIN members m
    ON l.member_id = m.member_id
WHERE l.return_date IS NULL
  AND l.due_date < CURRENT_DATE;


-- =========================================================
-- 16. FIND CURRENTLY AVAILABLE BOOKS
-- =========================================================

SELECT
    b.book_id,
    b.title,
    b.author,
    bc.copy_id
FROM books b
JOIN book_copies bc
    ON b.book_id = bc.book_id
WHERE bc.status = 'AVAILABLE'
ORDER BY b.title;


-- =========================================================
-- 17. COUNT AVAILABLE COPIES
-- =========================================================

SELECT
    b.book_id,
    b.title,
    COUNT(bc.copy_id) AS available_copies
FROM books b
LEFT JOIN book_copies bc
    ON b.book_id = bc.book_id
    AND bc.status = 'AVAILABLE'
GROUP BY
    b.book_id,
    b.title
ORDER BY b.title;


-- =========================================================
-- 18. MEMBER BORROWING HISTORY
-- =========================================================

-- Replace 1 with the member_id.

SELECT
    l.loan_id,
    b.title,
    bc.copy_id,
    l.borrow_date,
    l.due_date,
    l.return_date,
    l.status
FROM loans l
JOIN book_copies bc
    ON l.copy_id = bc.copy_id
JOIN books b
    ON bc.book_id = b.book_id
WHERE l.member_id = 1
ORDER BY l.borrow_date DESC;


-- =========================================================
-- 19. MEMBERS WHO HAVE OVERDUE BOOKS
-- =========================================================

SELECT DISTINCT
    m.member_id,
    m.first_name,
    m.last_name,
    m.email
FROM members m
JOIN loans l
    ON m.member_id = l.member_id
WHERE l.return_date IS NULL
  AND l.due_date < CURRENT_DATE;


-- =========================================================
-- 20. CHECK WHETHER MEMBER CAN BORROW
-- =========================================================

SELECT
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM loans
            WHERE member_id = 1
              AND return_date IS NULL
              AND due_date < CURRENT_DATE
        )
        THEN 'CANNOT BORROW'
        ELSE 'CAN BORROW'
    END AS borrowing_status;