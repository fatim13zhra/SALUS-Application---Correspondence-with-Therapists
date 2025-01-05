CREATE TABLE therapists (
    id INTEGER PRIMARY KEY,
    name TEXT,
    specialization TEXT
);

CREATE TABLE mental_issues (
    id INTEGER PRIMARY KEY,
    issue_name TEXT
);

CREATE TABLE user_mental_health (
    UserID INTEGER,
    issue_id INTEGER,
    PRIMARY KEY (UserID, issue_id),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (issue_id) REFERENCES mental_issues(id)
);

CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Name VARCHAR(100),
    Age INTEGER
);

CREATE TABLE Therapists (
    TherapistID INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    Gender VARCHAR(10),
    Price DECIMAL(10, 2),
    Availability VARCHAR(100)
);

CREATE TABLE UserPreferences (
    UserID INTEGER,
    Specialization VARCHAR(100),
    Gender VARCHAR(10),
    MaxPrice DECIMAL(10, 2),
    PRIMARY KEY (UserID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Sessions (
    SessionID INTEGER PRIMARY KEY,
    UserID INTEGER,
    TherapistID INTEGER,
    SessionDateTime DATETIME,
    SessionType VARCHAR(20),
    session_date DATE,
    session_notes TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (TherapistID) REFERENCES Therapists(TherapistID)
);

CREATE TABLE Feedback (
    FeedbackID INTEGER PRIMARY KEY,
    SessionID INTEGER,
    Rating INTEGER,
    Comment TEXT,
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID)
);
-- Populate therapists table
INSERT INTO therapists (id, name, specialization) VALUES
    (1, 'Dr. Smith', 'Cognitive Behavioral Therapy'),
    (2, 'Dr. Johnson', 'Psychodynamic Therapy');

-- Populate mental_issues table
INSERT INTO mental_issues (id, issue_name) VALUES
    (1, 'Anxiety'),
    (2, 'Depression'),
    (3, 'Stress');

-- Populate user_mental_health table
INSERT INTO user_mental_health (UserID, issue_id) VALUES
    (1, 1),  -- UserID 1 has Anxiety
    (1, 2),  -- UserID 1 has Depression
    (2, 2),  -- UserID 2 has Depression
    (2, 3);  -- UserID 2 has Stress

-- Populate Users table
INSERT INTO Users (UserID, Username, Password, Email, Name, Age) VALUES
    (1, 'user1', 'pass1', 'user1@example.com', 'Alice', 30),
    (2, 'user2', 'pass2', 'user2@example.com', 'Bob', 28);

-- Populate Therapists table
INSERT INTO Therapists (TherapistID, Name, Specialization, Gender, Price, Availability) VALUES
    (1, 'Dr. Smith', 'Cognitive Behavioral Therapy', 'Male', 150.00, 'Mon-Fri'),
    (2, 'Dr. Johnson', 'Psychodynamic Therapy', 'Female', 180.00, 'Mon, Wed, Fri');

-- Populate UserPreferences table
INSERT INTO UserPreferences (UserID, Specialization, Gender, MaxPrice) VALUES
    (1, 'Cognitive Behavioral Therapy', 'Any', 200.00),
    (2, 'Psychodynamic Therapy', 'Male', 250.00);

-- Populate Sessions table
INSERT INTO Sessions (SessionID, UserID, TherapistID, SessionDateTime, SessionType, session_date, session_notes) VALUES
    (1, 1, 1, '2023-01-15 10:00:00', 'Phone Call', '2023-01-15', 'Initial session with Dr. Smith'),
    (2, 2, 2, '2023-02-20 11:30:00', 'FaceTime', '2023-02-20', 'Session with Dr. Johnson');

-- Populate Feedback table
INSERT INTO Feedback (FeedbackID, SessionID, Rating, Comment) VALUES
    (1, 1, 4, 'Good session, looking forward to the next one.'),
    (2, 2, 5, 'Excellent therapist, very helpful.');
