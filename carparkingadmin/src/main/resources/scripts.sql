CREATE TABLE login (
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE profile (
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(255),
    height INT NOT NULL,
    weight INT NOT NULL,
    bmi INT,
    calories INT,
    activity VARCHAR(255),
    picture VARCHAR(255),
    waterintaketarget INT,
    waterconsumed INT,
    PRIMARY KEY (email)
);

CREATE TABLE nutrition (
    foodname VARCHAR(255) NOT NULL,
    protein INT NOT NULL,
    fat INT NOT NULL,
    carbs INT NOT NULL,
    calories INT NOT NULL,
    weight INT NOT NULL,
);

CREATE TABLE dailyintake (
    email VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    date VARCHAR(255) NOT NULL,
    mealtype VARCHAR(255) NOT NULL,
    foodconsumed VARCHAR(255) NOT NULL,
    weight INT NOT NULL,
    calories INT NOT NULL,
    protein INT NOT NULL,
    carbs INT NOT NULL,
    fat INT NOT NULL,
    consumed VARCHAR(255) NOT NULL,workout VARCHAR(255) NOT NULL,
        PRIMARY KEY (email)

);


-- Dummy insert scripts for login table
INSERT INTO login (username, password) VALUES ('John Doe', 'password123');
INSERT INTO login (username, password) VALUES ('Jane Smith', 'password456');
INSERT INTO login (username, password) VALUES ('Alice Brown', 'password789');

-- Dummy insert scripts for profile table
INSERT INTO profile (name, age, height, weight, bmi, calories, activity, picture, waterintaketarget, waterconsumed)
VALUES ('John Doe', 30, 180, 75, 23, 2500, 'Moderate', 'john_doe.jpg', 3000, 1500);
INSERT INTO profile (name, age, height, weight, bmi, calories, activity, picture, waterintaketarget, waterconsumed)
VALUES ('Jane Smith', 25, 165, 60, 22, 2000, 'Active', 'jane_smith.jpg', 2500, 1200);
INSERT INTO profile (name, age, height, weight, bmi, calories, activity, picture, waterintaketarget, waterconsumed)
VALUES ('Alice Brown', 35, 170, 68, 24, 2200, 'Low', 'alice_brown.jpg', 2800, 1400);

-- Dummy insert scripts for nutrition table
INSERT INTO nutrition (foodname, protein, fat, carbs, calories, weight)
VALUES ('Chicken Breast', 31, 3, 0, 165, 100);
INSERT INTO nutrition (foodname, protein, fat, carbs, calories, weight)
VALUES ('Apple', 0, 0, 25, 95, 150);
INSERT INTO nutrition (foodname, protein, fat, carbs, calories, weight)
VALUES ('Almonds', 6, 14, 6, 160, 28);

-- Dummy insert scripts for dailyintake table
INSERT INTO dailyintake (name, date, mealtype, foodconsumed, weight, calories, protein, carbs, fat, consumed,workout)
VALUES ('John Doe', '2024-07-25', 'Breakfast', 'Oatmeal', 200, 150, 5, 27, 3, 'yes','cycling=340,strengthtraining=120');
INSERT INTO dailyintake (name, date, mealtype, foodconsumed, weight, calories, protein, carbs, fat, consumed,workout)
VALUES ('Jane Smith', '2024-07-25', 'Lunch', 'Grilled Chicken Salad', 300, 350, 30, 10, 15, 'yes','cycling=55,strengthtraining=320');
INSERT INTO dailyintake (name, date, mealtype, foodconsumed, weight, calories, protein, carbs, fat, consumed),workout
VALUES ('Alice Brown', '2024-07-25', 'Dinner', 'Steak and Vegetables', 400, 500, 40, 20, 25, 'yes','cycling=678,strengthtraining=120');
