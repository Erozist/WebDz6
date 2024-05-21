-- Створення таблиці студентів
CREATE TABLE IF NOT EXISTS students (
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups(group_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Створення таблиці груп
CREATE TABLE IF NOT EXISTS groups (
    group_id INTEGER PRIMARY KEY,
    group_name TEXT
);

-- Створення таблиці викладачів
CREATE TABLE IF NOT EXISTS teachers (
    teacher_id INTEGER PRIMARY KEY,
    name TEXT
);

-- Створення таблиці предметів
CREATE TABLE IF NOT EXISTS subjects (
    subject_id INTEGER PRIMARY KEY,
    subject_name TEXT,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Створення таблиці оцінок студентів
CREATE TABLE IF NOT EXISTS grades (
    grade_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    subject_id INTEGER,
    grade INTEGER,
    date_received DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
        ON DELETE CASCADE
        ON UPDATE CASCADE
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
