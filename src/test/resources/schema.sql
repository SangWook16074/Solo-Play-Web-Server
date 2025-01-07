CREATE TABLE IF NOT EXISTS member (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    nick_name VARCHAR(255) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    role BIGINT UNSIGNED,
    image_url VARCHAR(255),
    FOREIGN KEY (role) REFERENCES role(id)
);

CREATE TABLE IF NOT EXISTS role (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(255) NOT NULL,
    member_id BIGINT UNSIGNED,
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE IF NOT EXISTS post (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,
    content TEXT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES member(id)
);

CREATE TABLE IF NOT EXISTS palace (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    description TEXT,
    urls VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS course (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `like`` INT DEFAULT 0,
    region VARCHAR(255),
    category VARCHAR(255),
    title VARCHAR(255),
    content TEXT,
    palace BIGINT UNSIGNED,
    review BIGINT UNSIGNED,
    FOREIGN KEY (user_id) REFERENCES member(id),
    FOREIGN KEY (palace) REFERENCES palace(id),
    FOREIGN KEY (review) REFERENCES review(id)
);

CREATE TABLE IF NOT EXISTS review (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    content TEXT,
    super_id BIGINT UNSIGNED,
    avg_cost DECIMAL(10,2),
    cos_id BIGINT UNSIGNED,
    category VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES member(id),
    FOREIGN KEY (super_id) REFERENCES review(id)
);

CREATE TABLE IF NOT EXISTS comment (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,
    comment TEXT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    super_id BIGINT UNSIGNED,
    post_id BIGINT UNSIGNED,
    FOREIGN KEY (user_id) REFERENCES member(id),
    FOREIGN KEY (post_id) REFERENCES post(id),
    FOREIGN KEY (super_id) REFERENCES comment(id)
);
