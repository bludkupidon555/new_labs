DROP TABLE IF EXISTS emptable;
CREATE TABLE emptable (Name TEXT);

INSERT INTO emptable VALUES ('Rublev Dmitriy');
INSERT INTO emptable VALUES ('Turubar Ivan');
INSERT INTO emptable VALUES ('Prilipchanu Daniil');
INSERT INTO emptable VALUES ('Zinko Danil');
INSERT INTO emptable VALUES ('Pogodin Petr');
INSERT INTO emptable VALUES ('Krivosheev Alexey');
INSERT INTO emptable VALUES ('Arthas');
INSERT INTO emptable VALUES ('Lich King');
INSERT INTO emptable VALUES ('Murlok');
INSERT INTO emptable VALUES ('Sylvanas Windrunner');


DROP TABLE IF EXISTS langtable;
CREATE TABLE langtable (Language TEXT);

INSERT INTO langtable VALUES ('C');
INSERT INTO langtable VALUES ('Java');
INSERT INTO langtable VALUES ('Phyton');
INSERT INTO langtable VALUES ('C++');
INSERT INTO langtable VALUES ('C#');
INSERT INTO langtable VALUES ('Visual Basic');
INSERT INTO langtable VALUES ('JavaScript');
INSERT INTO langtable VALUES ('R');
INSERT INTO langtable VALUES ('PHP');
INSERT INTO langtable VALUES ('Swift');
INSERT INTO langtable VALUES ('Lua');


DROP TABLE IF EXISTS maptable;
CREATE TABLE maptable (Name TEXT, Language Text);

INSERT INTO maptable VALUES ('Rublev Dmitriy', 'Java');
INSERT INTO maptable VALUES ('Rublev Dmitriy', 'C#');
INSERT INTO maptable VALUES ('Rublev Dmitriy', 'JavaScript');
INSERT INTO maptable VALUES ('Turubar Ivan', 'C#');
INSERT INTO maptable VALUES ('Turubar Ivan', 'JavaScript');
INSERT INTO maptable VALUES ('Turubar Ivan', 'Lua');
INSERT INTO maptable VALUES ('Turubar Ivan', 'C++');
INSERT INTO maptable VALUES ('Prilipchanu Daniil', 'C#');
INSERT INTO maptable VALUES ('Prilipchanu Daniil', 'JavaScript');
INSERT INTO maptable VALUES ('Prilipchanu Daniil', 'R');
INSERT INTO maptable VALUES ('Zinko Danil', 'C#');
INSERT INTO maptable VALUES ('Zinko Danil', 'PHP');
INSERT INTO maptable VALUES ('Zinko Danil', 'Phyton');
INSERT INTO maptable VALUES ('Pogodin Petr', 'C#');
INSERT INTO maptable VALUES ('Pogodin Petr', 'Java');
INSERT INTO maptable VALUES ('Pogodin Petr', 'Lua');
INSERT INTO maptable VALUES ('Pogodin Petr', 'PHP');
INSERT INTO maptable VALUES ('Krivosheev Alexey', 'C#');
INSERT INTO maptable VALUES ('Krivosheev Alexey', 'C');
INSERT INTO maptable VALUES ('Krivosheev Alexey', 'Lua');
INSERT INTO maptable VALUES ('Arthas', 'Lua');
INSERT INTO maptable VALUES ('Arthas', 'Java');
INSERT INTO maptable VALUES ('Arthas', 'R');
INSERT INTO maptable VALUES ('Lich King', 'Lua');
INSERT INTO maptable VALUES ('Lich King', 'Visual Basic');
INSERT INTO maptable VALUES ('Lich King', 'C++');
INSERT INTO maptable VALUES ('Murlok', 'Swift');
INSERT INTO maptable VALUES ('Murlok', 'PHP');
INSERT INTO maptable VALUES ('Murlok', 'Visual Basic');
INSERT INTO maptable VALUES ('Sylvanas Windrunner', 'Lua');
INSERT INTO maptable VALUES ('Sylvanas Windrunner', 'C');
INSERT INTO maptable VALUES ('Sylvanas Windrunner', 'Java');
