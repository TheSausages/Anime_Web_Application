CREATE
    SCHEMA IF NOT EXISTS anime;

CREATE
    TABLE
        IF NOT EXISTS anime.Anime(
            anime_id UUID NOT NULL UNIQUE CONSTRAINT pk_anime PRIMARY KEY,
            title TEXT NOT NULL,
            average_episode_length INTEGER DEFAULT 25
        );

CREATE
    TABLE
        IF NOT EXISTS anime.Review(
            review_id UUID NOT NULL UNIQUE CONSTRAINT pk_review PRIMARY KEY,
            anime_id UUID NOT NULL,
            title VARCHAR(100) NOT NULL CHECK(
                TRIM( title )!= ''
            ),
            text VARCHAR(300) DEFAULT 'No text given',
            nr_helpful INTEGER NOT NULL DEFAULT 0 CHECK(
                nr_helpful >= 0
            ),
            nr_plus INTEGER NOT NULL DEFAULT 0 CHECK(
                nr_plus >= 0
            ),
            nr_minus INTEGER NOT NULL DEFAULT 0 CHECK(
                nr_minus >= 0
            ),
            modification timestamptz NOT NULL DEFAULT NOW(),
            CONSTRAINT fk_review FOREIGN KEY(anime_id) REFERENCES anime.anime
        );

CREATE
    TYPE status AS ENUM(
        'NO_STATUS',
        'WATCHING',
        'COMPLETED',
        'DROPPED',
        'PLAN_TO_WATCH'
    );

CREATE
    TABLE
        IF NOT EXISTS anime.Anime_User_Info(
            anime_id UUID NOT NULL UNIQUE CONSTRAINT fk_anime_anime_user_info REFERENCES anime.Anime(anime_id),
            user_id UUID NOT NULL UNIQUE,
            CONSTRAINT pk_anime_user_info PRIMARY KEY(
                anime_id,
                user_id
            ),
            status status NOT NULL DEFAULT 'NO_STATUS',
            watch_start_date DATE,
            watch_end_date DATE,
            nr_episodes_seen INTEGER DEFAULT 0 NOT NULL,
            is_favourite BOOLEAN DEFAULT FALSE NOT NULL,
            grade INTEGER CHECK(
                grade >= 0
                AND grade <= 10
            ),
            modification_date timestamptz DEFAULT NOW(),
            review UUID UNIQUE,
            CONSTRAINT fk_anime_user_info_review FOREIGN KEY(review) REFERENCES anime.Review(review_id)
        );
