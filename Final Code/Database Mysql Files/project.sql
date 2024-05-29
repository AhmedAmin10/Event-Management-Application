CREATE DATABASE em;

-- Switch to the 'em' Database
USE em;
CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    organizer VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    location VARCHAR(255) NOT NULL,
    description TEXT
);
CREATE TABLE admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO admin (username, password, email) VALUES
('admin1', SHA2('password1', 256), 'admin1@example.com'),
('admin2', SHA2('password2', 256), 'admin2@example.com'),
('admin3', SHA2('password3', 256), 'admin3@example.com'),
('admin4', SHA2('password4', 256), 'admin4@example.com'),
('admin5', SHA2('password5', 256), 'admin5@example.com'),
('admin6', SHA2('password6', 256), 'admin6@example.com'),
('admin7', SHA2('password7', 256), 'admin7@example.com'),
('admin8', SHA2('password8', 256), 'admin8@example.com'),
('admin9', SHA2('password9', 256), 'admin9@example.com'),
('admin10', SHA2('password10', 256), 'admin10@example.com'),
('admin11', SHA2('password11', 256), 'admin11@example.com'),
('admin12', SHA2('password12', 256), 'admin12@example.com'),
('admin13', SHA2('password13', 256), 'admin13@example.com'),
('admin14', SHA2('password14', 256), 'admin14@example.com'),
('admin15', SHA2('password15', 256), 'admin15@example.com'),
('admin16', SHA2('password16', 256), 'admin16@example.com'),
('admin17', SHA2('password17', 256), 'admin17@example.com'),
('admin18', SHA2('password18', 256), 'admin18@example.com'),
('admin19', SHA2('password19', 256), 'admin19@example.com'),
('admin20', SHA2('password20', 256), 'admin20@example.com');

CREATE TABLE attendee (
    attendee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO attendee (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-8765'),
('Bob', 'Williams', 'bob.williams@example.com', '555-4321'),
('Charlie', 'Brown', 'charlie.brown@example.com', '555-1111'),
('David', 'Jones', 'david.jones@example.com', '555-2222'),
('Eve', 'Miller', 'eve.miller@example.com', '555-3333'),
('Frank', 'Davis', 'frank.davis@example.com', '555-4444'),
('Grace', 'Garcia', 'grace.garcia@example.com', '555-5555'),
('Hank', 'Martinez', 'hank.martinez@example.com', '555-6666'),
('Ivy', 'Rodriguez', 'ivy.rodriguez@example.com', '555-7777'),
('Jack', 'Martinez', 'jack.martinez@example.com', '555-8888'),
('Kathy', 'Hernandez', 'kathy.hernandez@example.com', '555-9999'),
('Larry', 'Lopez', 'larry.lopez@example.com', '555-0000'),
('Mona', 'Gonzalez', 'mona.gonzalez@example.com', '555-1212'),
('Nina', 'Wilson', 'nina.wilson@example.com', '555-3434'),
('Oscar', 'Anderson', 'oscar.anderson@example.com', '555-5656'),
('Paul', 'Thomas', 'paul.thomas@example.com', '555-7878'),
('Quinn', 'Taylor', 'quinn.taylor@example.com', '555-9090'),
('Rick', 'Lee', 'rick.lee@example.com', '555-0101');


INSERT INTO events (id, event_name, organizer, date, location, description) VALUES
    (1, 'Tech Conference 2024', 'Event Management Inc.', '2024-06-15', 'New York, NY', 'A conference for tech enthusiasts and professionals.'),
    (2, 'Healthcare Summit', 'Conference Planners Ltd.', '2024-07-20', 'Los Angeles, CA', 'An event focused on the latest in healthcare innovation.'),
    (3, 'Global Marketing Expo', 'Global Events Group', '2024-08-05', 'Chicago, IL', 'Bringing together marketing professionals from around the world.'),
    (4, 'Education Forum', 'XYZ Conferences', '2024-09-10', 'Houston, TX', 'Discussing the future of education and learning technologies.'),
    (5, 'Finance World 2024', 'Summit Organizers', '2024-10-12', 'San Francisco, CA', 'A gathering of finance professionals and experts.'),
    (6, 'Environmental Summit', 'Mega Events Corp.', '2024-11-18', 'Denver, CO', 'Focused on sustainability and environmental issues.'),
    (7, 'Innovative Startups Meet', 'Pro Conference Services', '2024-12-01', 'Seattle, WA', 'Connecting startups with investors and mentors.'),
    (8, 'AI & Robotics Expo', 'Elite Meetings', '2024-12-15', 'Boston, MA', 'Exploring the latest advancements in AI and robotics.'),
    (9, 'Global Retail Summit', 'Eventful Solutions', '2025-01-20', 'Miami, FL', 'Discussing trends and innovations in retail.'),
    (10, 'Cybersecurity Forum', 'Global Connect Events', '2025-02-05', 'Las Vegas, NV', 'Addressing the latest in cybersecurity threats and solutions.'),
    (11, 'Medical Tech Conference', 'Infinite Conventions', '2025-03-12', 'Phoenix, AZ', 'Showcasing the latest in medical technology.'),
    (12, 'Real Estate Expo', 'Symposium Planners', '2025-04-10', 'Dallas, TX', 'Bringing together real estate professionals and investors.'),
    (13, 'Automotive Summit', 'Event Horizon', '2025-05-05', 'Detroit, MI', 'Exploring the future of the automotive industry.'),
    (14, 'Global HR Conference', 'Summit Solutions', '2025-06-15', 'Atlanta, GA', 'Discussing trends and innovations in human resources.'),
    (15, 'Blockchain Expo', 'Global Innovators', '2025-07-20', 'San Diego, CA', 'Exploring blockchain technology and its applications.'),
    (16, 'Energy Future Summit', 'EventCrafters', '2025-08-10', 'Austin, TX', 'Focused on the future of energy and sustainability.'),
    (17, 'Food & Beverage Expo', 'Peak Events', '2025-09-15', 'Orlando, FL', 'Showcasing the latest in food and beverage industry.'),
    (18, 'Sports Innovation Conference', 'Confero Solutions', '2025-10-10', 'Nashville, TN', 'Exploring innovations in the sports industry.'),
    (19, 'Digital Media Summit', 'NexGen Conferences', '2025-11-05', 'Portland, OR', 'Discussing trends and advancements in digital media.'),
    (20, 'Global Tourism Expo', 'Event Nexus', '2025-12-01', 'Honolulu, HI', 'Focusing on the future of global tourism and travel.');

CREATE TABLE users (
    email VARCHAR(40) PRIMARY KEY,
    password VARCHAR(40) NOT NULL
);

    drop table users;
INSERT INTO users (email, password) VALUES ('a@gmail.com', '123');
select * from users;

select * from attendee;
ALTER TABLE events DROP COLUMN id;
ALTER TABLE events ADD PRIMARY KEY (event_name);
select * from events ;

ALTER TABLE events MODIFY COLUMN id INT AUTO_INCREMENT;
