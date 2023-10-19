CREATE
    SCHEMA IF NOT EXISTS users;

CREATE
    TYPE supported_languages AS ENUM(
        'ENGLISH',
        'POLISH'
    );

CREATE
    TYPE color_mode AS ENUM(
        'LIGHT',
        'DARK'
    );

CREATE
    TABLE
        IF NOT EXISTS users.user(
            user_id UUID NOT NULL UNIQUE CONSTRAINT pk_user PRIMARY KEY,
            username VARCHAR(45) NOT NULL UNIQUE,
            preferred_language supported_languages NOT NULL DEFAULT 'ENGLISH',
            preferred_color_mode color_mode NOT NULL DEFAULT 'DARK'
        );
