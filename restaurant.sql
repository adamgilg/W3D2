CREATE TABLE chef (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  restaurant_id INTEGER,
  mentor INTEGER
);

CREATE TABLE restaurant (
  restaurant_id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  neighborhood VARCHAR(255),
  cuisine VARCHAR(255)
);

CREATE TABLE head_chef_tenures (
  id INTEGER,
  restaurant_id INTEGER,
  start_date DATE,
  end_date DATE
  -- FOREIGN KEY (chef) REFERENCES chef(chef_id),
  -- FOREIGN KEY (restaurant) REFERENCES restaurant(restaurant_id)
);

CREATE TABLE critic (
  id INTEGER PRIMARY KEY,
  screen_name VARCHAR(255)
);

CREATE TABLE restaurant_review (
  id INTEGER PRIMARY KEY,
  critic_id INTEGER,
  restaurant_id INTEGER,
  text_review TEXT,
  score INTEGER,
  review_date TIMESTAMP
);

INSERT INTO chef (first_name, last_name, restaurant_id)
VALUES ('Sean', 'Kim', 2),
      ('Rawt', 'Fieim', 1),
      ('Grawt', 'Kirrrm', 4),
      ('Ned', 'Ruggeri', 3);

INSERT INTO restaurant (name, neighborhood, cuisine)
VALUES ('Cool Trendy', 'Hipster City', 'Post-Neo-Modern-Triple-Fusion'),
      ('Lame Cafe', 'Square City', 'Boring'),
      ('The Naam', 'Kitsilano', 'Vegetarian'),
      ('Foundation', 'Main St.', 'Vegetarian');

