CREATE
    SCHEMA IF NOT EXISTS users;

CREATE
    TYPE languages AS ENUM(
        'ENGLISH',
        'POLISH'
    );

CREATE
    TYPE mode AS ENUM(
        'LIGHT',
        'DARK'
    );

CREATE
    TABLE
        IF NOT EXISTS users.User(
            user_id UUID NOT NULL UNIQUE CONSTRAINT pk_user PRIMARY KEY,
            username VARCHAR(45) NOT NULL UNIQUE,
            preferred_language languages NOT NULL DEFAULT 'ENGLISH',
            mode mode NOT NULL DEFAULT 'DARK'
        );
