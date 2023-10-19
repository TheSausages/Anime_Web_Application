CREATE
    SCHEMA IF NOT EXISTS users;

CREATE
    TABLE
        IF NOT EXISTS users.achievement(
            achievement_id UUID NOT NULL UNIQUE CONSTRAINT pk_achievement PRIMARY KEY,
            name VARCHAR(200) NOT NULL UNIQUE,
            description VARCHAR(600),
            icon_path VARCHAR(100),
            points INTEGER
        );

CREATE
    TABLE
        IF NOT EXISTS users.user_achievement(
            achievement_id UUID NOT NULL UNIQUE CONSTRAINT fk_achievement_users_achievement REFERENCES users.Achievement(achievement_id),
            user_id UUID NOT NULL UNIQUE CONSTRAINT fk_users_users_achievement REFERENCES users.User(user_id),
            CONSTRAINT pk_anime_account_info PRIMARY KEY(
                achievement_id,
                user_id
            )
        )
