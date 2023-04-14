CREATE TABLE timeslots (
	id INTEGER PRIMARY KEY,
	start_time TIME,
	end_time TIME
);

CREATE TABLE temp (
	id INTEGER PRIMARY KEY,
	number INTEGER,
	buildingid INTEGER,
	seating INTEGER,
	FOREIGN KEY (buildingid) REFERENCES buildings(id)
);	

DROP TABLE rooms;

ALTER TABLE temp RENAME to rooms;

CREATE TABLE schedule (
	coursecode VARCHAR,
	roomid INTEGER,
	timeslotid INTEGER,
	FOREIGN KEY (coursecode) REFERENCES courses(code),
	FOREIGN KEY (roomid) REFERENCES rooms(id),
	FOREIGN KEY (timeslotid) REFERENCES timeslots(id),
	UNIQUE (roomid, timeslotid)
);

INSERT INTO timeslots VALUES (1, '08:30:00', '10:20:00');
INSERT INTO rooms VALUES (1, 400, (SELECT id FROM buildings WHERE name = 'Mary Gates Hall'), 40);
INSERT INTO schedule(coursecode, roomid, timeslotid) VALUES ('INFO330A', 1, 1);
