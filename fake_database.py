import random
import logging

from faker import Faker
from sqlite3 import connect, DatabaseError


# Ініціалізуємо Faker
fake = Faker()

# З'єднання з базою даних
conn = connect('university.db')
c = conn.cursor()

# Заповнення таблиці груп
groups = [('Group A',), ('Group B',), ('Group C',)]
c.executemany('INSERT INTO groups (group_name) VALUES (?)', groups)

# Заповнення таблиці викладачів
teachers = [(fake.name(),) for _ in range(5)]
c.executemany('INSERT INTO teachers (name) VALUES (?)', teachers)

# Заповнення таблиці предметів
subjects = [(fake.word(), random.randint(1, 5)) for _ in range(8)]
c.executemany('INSERT INTO subjects (subject_name, teacher_id) VALUES (?, ?)', subjects)

# Заповнення таблиці студентів та оцінок
for _ in range(40):
    name = fake.name()
    group_id = random.randint(1, 3)
    c.execute('INSERT INTO students (name, group_id) VALUES (?, ?)', (name, group_id))
    student_id = c.lastrowid
    for subject_id in range(1, 9):
        for _ in range(5):
            grade = random.randint(60, 100)
            date_received = fake.date_between(start_date='-1y', end_date='today')
            c.execute('INSERT INTO grades (student_id, subject_id, grade, date_received) VALUES (?, ?, ?, date(?))',
                      (student_id, subject_id, grade, date_received))


try:
    # Збереження змін
    conn.commit()
except DatabaseError as e:
    logging.error(e)
    conn.rollback()
finally:
    # Закриття підключення
    conn.close()
