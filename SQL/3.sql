CREATE DATABASE IF NOT EXISTS staff;
use staff;

CREATE TABLE IF NOT EXISTS profession(
prof_id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
prof_name  VARCHAR(20) NOT NULL
);
INSERT INTO profession VALUES(NULL,"cleaner");
INSERT INTO profession VALUES(NULL,"driver");
INSERT INTO profession VALUES(NULL,"programmer");
INSERT INTO profession VALUES(NULL,"tester");
INSERT INTO profession VALUES(NULL,"manager");
SELECT * FROM profession;

CREATE TABLE IF NOT EXISTS person (
person_id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
last_name VARCHAR(20) NOT NULL,
first_name VARCHAR(20) NOT NULL, 
prof_id INT UNSIGNED NOT NULL,
rate INT NOT NULL,
FOREIGN KEY (prof_id) REFERENCES profession (prof_id)
);

INSERT INTO person VALUES(NULL, "Элиашев", "Мартын", 1, 15000 );
INSERT INTO person VALUES(NULL, "Смотрова", "Бронислава", 2, 20000);
INSERT INTO person VALUES(NULL, "Званцева", "Алиса", 3, 50000);
INSERT INTO person VALUES(NULL, "Крупнов", "Виссарион", 3, 50000);
INSERT INTO person VALUES(NULL, "Янушкене", "Рюрик", 4, 40000);
INSERT INTO person VALUES(NULL, "Смелоча", "Анисья", 5, 40000);
INSERT INTO person VALUES(NULL, "Жеффре","Борис", 5, 40000);

SELECT * FROM person WHERE rate < 30000 ORDER BY rate DESC;

SELECT person.last_name, person.first_name, profession.prof_name
 FROM person NATURAL JOIN profession 
 WHERE (person.rate < 30000 AND profession.prof_name = "driver");


 
CREATE TABLE IF NOT EXISTS dependensies(
head INT UNSIGNED NOT NULL,
subordinate INT UNSIGNED NOT NULL,
PRIMARY KEY (head , subordinate),
FOREIGN KEY (head) REFERENCES person (person_id),
FOREIGN KEY (subordinate) REFERENCES person (person_id)
);

SELECT * FROM person;

INSERT INTO dependensies VALUES (7,1);
INSERT INTO dependensies VALUES (6,1);
INSERT INTO dependensies VALUES (7,2);
INSERT INTO dependensies VALUES (7,3);
INSERT INTO dependensies VALUES (6,7);

SELECT s.last_name, s.first_name, s.prof_id
 FROM person as s  LEFT JOIN dependensies  
 ON dependensies.head=7 WHERE dependensies.subordinate = s.person_id;
