CREATE DATABASE trainstation;

  ALTER TABLE trainstation.employees
  ADD gender VARCHAR(225) AFTER position;
  
  delete from trainstation.Reservation where reservation_id= (3123);
  
 ALTER TABLE trainstation.employees
  drop column name;
 
 describe trainstation.stations;
 
ALTER TABLE trainstation.stations MODIFY station_name VARCHAR(55);
  
CREATE TABLE Stations (
 station_id INT AUTO_INCREMENT,
  station_name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  other_station_detail VARCHAR(255) NOT NULL,
  PRIMARY KEY (station_id)
  );
  
  INSERT INTO Stations (station_id,station_name,location,other_station_detail)
VALUES 
('4084','BAYU','PETLING JAYA','WORKING'),
('2341','WAK','SHAH ALAM','WORKING'),
('6437','TOK','SHAH ALAM','WORKING'),
('6950','LAI','SETIA ALAM','ABANDON'),
('0534','TOKO','PUCHONG','WORKING');

  
  CREATE TABLE Trains (
  train_id INT AUTO_INCREMENT,
  station_id INT NOT NULL,
  train_name VARCHAR(225) NOT NULL,
  type VARCHAR(225) NOT NULL,
  capacity INT NOT NULL,
  other_train_detail VARCHAR(255) NOT NULL,
  PRIMARY KEY (train_id), 
  FOREIGN KEY (station_id) REFERENCES Stations(station_id)
  );
  
  INSERT INTO Trains (train_id,station_id,train_name,type,capacity,other_train_detail)
VALUES
('7957','4084','SOG','LONG','100','ACTIVE'),
('9668','2341','TRI','LONG','100','ACTIVE'),
('3238','6437','McQUEEN','SHORT','50','ABANDON'),
('6652','6950','DOL','STANDARD','70','ACTIVE'),
('1478','0534','DAB','LONG','70','ACTIVE');
  
  CREATE TABLE Train_schedule (
  schedule_id INT AUTO_INCREMENT,
  train_id INT NOT NULL,
  route_id INT NOT NULL,
  depature_time VARCHAR(225) NOT NULL,
  arrival_time VARCHAR(225) NOT NULL,
  other_schedule_details VARCHAR(225) NOT NULL,
  PRIMARY KEY (schedule_id),
  FOREIGN KEY (train_id) REFERENCES Trains(train_id),
  FOREIGN KEY (route_id) REFERENCES Routes(route_id)
  );
  
   INSERT INTO Train_schedule (schedule_id,train_id,route_id,depature_time,arrival_time,other_schedule_details)
VALUES
('0223','7957','1123','5am','10am','ACTIVE'),
('1256','9668','6577','5am','10am','ACTIVE'),
('9564','3238','9475','4am','10am','ACTIVE'),
('6773','6652','2467','4am','10am','ACTIVE'),
('9927','1478','1276','6am','10am','ACTIVE');
  
  
  CREATE TABLE Routes (
 route_id INT AUTO_INCREMENT,
  route_name VARCHAR(255) NOT NULL,
  distance VARCHAR(255) NOT NULL,
  other_routes_details VARCHAR(255) NOT NULL,
  PRIMARY KEY (route_id)
  );
  
   INSERT INTO Routes (route_id,route_name,distance,other_routes_details)
VALUES
('1123','LAS','17km','ACTIVE'),
('6577','ODE','56km','ACTIVE'),
('9475','TTE','94km','ACTIVE'),
('2467','OTI','24km','ACTIVE'),
('1276','LOL','12km','ACTIVE');
  
  CREATE TABLE Passengers (
  passenger_id INT AUTO_INCREMENT,
  name VARCHAR(225) NOT NULL,
  age VARCHAR(225) NOT NULL,
  contact_no VARCHAR(225) NOT NULL,
  other_passenger_details VARCHAR(225) NOT NULL,
  PRIMARY KEY (passenger_id)
  );
  INSERT INTO Passengers (passenger_id,name,age,contact_no,other_passenger_details)
VALUES
('1111','ALI','23','0156723654','ACTIVE'),
('1234','AHMAD','56','0142367894','ACTIVE'),
('9452','ASENG','75','0175364778','ACTIVE'),
('6664','CHONG','27','0134526738','ACTIVE'),
('8759','CHIN','16','01131455262','ACTIVE');
  
  CREATE TABLE Tickets (
  ticket_id INT AUTO_INCREMENT,
  passenger_id int NOT NULL,
  schedule_id int NOT NULL,
  seat_number INT NOT NULL,
  ticket_status VARCHAR(225) NOT NULL,
  other_ticket_details VARCHAR(225) NOT NULL,
  PRIMARY KEY (ticket_id),
  FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
  FOREIGN KEY (schedule_id) REFERENCES Train_schedule(schedule_id)
  );
   INSERT INTO Tickets (ticket_id,passenger_id,schedule_id,seat_number,ticket_status,other_ticket_details)
VALUES
('0287','1111','0223','5','ACTIVE','ACTIVE'),
('1996','1234','1256','13','ACTIVE','ACTIVE'),
('2234','9452','9564','3','ACTIVE','ACTIVE'),
('6003','6664','6773','4','ACTIVE','ACTIVE'),
('9127','8759','9927','6','ACTIVE','ACTIVE');
  
  CREATE TABLE Employees (
  employee_id INT NOT NULL,
  name VARCHAR(225) NOT NULL,
  position VARCHAR(225) NOT NULL,
  contact_info VARCHAR(225) NOT NULL,
  other_employee_details VARCHAR(225) NOT NULL,
  PRIMARY KEY (employee_id)
  );
  
  
     INSERT INTO Employees (employee_id,name,position,contact_info,other_employee_details)
VALUES
('2228','MAL','INTERN','CALL','ACTIVE'),
('1237','SITI','MANAGER','EMAIL','ACTIVE'),
('9364','MAN','INTERN','CALL','ACTIVE'),
('6103','LUQMAN','HEADCHIEF','CALL','ACTIVE'),
('6127','IROL','INTERN','EMAIL','ACTIVE');
  
  CREATE TABLE Train_Staff (
  staff_id INT NOT NULL,
  train_id INT NOT NULL,
  employee_id INT NOT NULL,
  role VARCHAR(225) NOT NULL,
  other_staff_details VARCHAR(225) NOT NULL,
  PRIMARY KEY (staff_id),
  FOREIGN KEY (train_id) REFERENCES Train_schedule(train_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
  );
  INSERT INTO Train_Staff (staff_id,train_id,employee_id,role,other_staff_details)
VALUES
('7777','7957','2228','ADVISOR','ACTIVE'),
('1996','9668','1237','MANAGER','ACTIVE'),
('7764','3238','9364','STORE','ACTIVE'),
('4473','6652','6103','INTERN','ACTIVE'),
('3227','1478','6127','NEW','ACTIVE');
  
  CREATE TABLE Maintenance_Log (
  log_id INT NOT NULL,
  train_id INT NOT NULL,
  maintenance_date INT NOT NULL,
  description VARCHAR(225) NOT NULL,
  other_maintanence_details VARCHAR(225) NOT NULL,
  PRIMARY KEY (log_id),
  FOREIGN KEY (train_id) REFERENCES Train_Staff(train_id)
  );
  INSERT INTO Maintenance_Log (log_id,train_id,maintenance_date,description,other_maintanence_details)
VALUES
('7766','7957','12','RAIL','ACTIVE'),
('1846','9668','25','AIRCOND','ACTIVE'),
('7924','3238','24','COCKPIT','ACTIVE'),
('4323','6652','13','WINDOW','ACTIVE'),
('3117','1478','17','DOOR','ACTIVE');
  
  CREATE TABLE Train_Coaches (
  coach_id INT NOT NULL,
  train_id INT NOT NULL,
  coach_number INT NOT NULL,
  coach_type VARCHAR(225) NOT NULL,
  capacity VARCHAR(225) NOT NULL,
  other_coach_details VARCHAR(225) NOT NULL,
  PRIMARY KEY (coach_id),
  FOREIGN KEY (train_id) REFERENCES Maintenance_Log(train_id)
  );
  INSERT INTO Train_Coaches (coach_id,train_id,coach_number,coach_type,capacity,other_coach_details)
VALUES
('7766','7957','12','RAIL','90','ACTIVE'),
('1846','9668','25','AIRCOND','120','ACTIVE'),
('7924','3238','24','COCKPIT','209','ACTIVE'),
('4323','6652','13','WINDOW','88','ACTIVE'),
('3117','1478','17','DOOR','78','ACTIVE');
  
CREATE TABLE Reservation (
  reservation_id INT NOT NULL,
  passenger_id INT NOT NULL,
  coach_id INT NOT NULL,
  seat_number INT NOT NULL,
  reservation_status VARCHAR(225) NOT NULL,
  other_reservation_details VARCHAR(225) NOT NULL,
  PRIMARY KEY (reservation_id),
  FOREIGN KEY (passenger_id) REFERENCES Tickets(passenger_id),
  FOREIGN KEY (coach_id) REFERENCES Train_Coaches(coach_id)
  );
  INSERT INTO Reservation (reservation_id,passenger_id,coach_id,seat_number,reservation_status,other_reservation_details)
VALUES
('7788','1111','7766','23','RESERVED','ACTIVE'),
('1855','1234','1846','44','RESERVED','ACTIVE'),
('7932','9452','7924','24','RESERVED','ACTIVE'),
('4345','6664','4323','45','RESERVED','ACTIVE'),
('3123','8759','3117','76','RESERVED','ACTIVE');
  
  SELECT * FROM trainstation.Stations
  
