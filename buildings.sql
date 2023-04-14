CREATE TABLE buildings (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR NOT NULL CHECK (LENGTH(name) <= 80),
	shortname VARCHAR UNIQUE CHECK (LENGTH(shortname) <= 10)
);
	
CREATE TABLE rooms (
	number INTEGER,
	buildingid INTEGER,
	seating INTEGER,
	FOREIGN KEY (buildingid) REFERENCES buildings(id)
);	

INSERT INTO buildings (name, shortname) VALUES ('Mary Gates Hall', 'MGH');
INSERT INTO rooms VALUES (400, (SELECT id FROM buildings WHERE name = 'Mary Gates Hall'), 40);