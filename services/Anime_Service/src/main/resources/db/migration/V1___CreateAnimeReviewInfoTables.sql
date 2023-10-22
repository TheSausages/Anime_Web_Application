CREATE
    SCHEMA IF NOT EXISTS anime;

CREATE
    TABLE
        IF NOT EXISTS anime.anime(
            anime_id UUID NOT NULL UNIQUE CONSTRAINT pk_anime PRIMARY KEY,
            title TEXT NOT NULL,
            average_episode_length INTEGER DEFAULT 25
        );

CREATE
    TABLE
        IF NOT EXISTS anime.review(
            review_id UUID NOT NULL UNIQUE CONSTRAINT pk_review PRIMARY KEY,
            anime_id UUID NOT NULL,
            title VARCHAR(100) NOT NULL CHECK(
                TRIM( title )!= ''
            ),
            text VARCHAR(300) DEFAULT 'No text given',
            creation timestamptz NOT NULL DEFAULT NOW(),
            modification timestamptz NOT NULL DEFAULT NOW(),
            CONSTRAINT fk_review FOREIGN KEY(anime_id) REFERENCES anime.anime
        );

CREATE
    TABLE
        IF NOT EXISTS anime.review_opinion(
            review_id UUID NOT NULL CONSTRAINT fk_review_review_opinion REFERENCES anime.review(review_id),
            user_id UUID NOT NULL,
            CONSTRAINT pk_review_opinions PRIMARY KEY(
                review_id,
                user_id
            ),
            is_liked bool NOT NULL DEFAULT FALSE,
            is_disliked bool NOT NULL DEFAULT FALSE,
            is_reported bool NOT NULL DEFAULT FALSE
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
        IF NOT EXISTS anime.anime_user_info(
            anime_id UUID NOT NULL CONSTRAINT fk_anime_anime_user_info REFERENCES anime.anime(anime_id),
            user_id UUID NOT NULL,
            CONSTRAINT pk_anime_user_info PRIMARY KEY(
                anime_id,
                user_id
            ),
            status status NOT NULL DEFAULT 'NO_STATUS',
            watch_start_date DATE CHECK(
                watch_start_date <= now()
            ),
            watch_end_date DATE CHECK(
                watch_start_date <= now()
            ),
            nr_episodes_seen INTEGER DEFAULT 0 NOT NULL,
            is_favourite BOOLEAN DEFAULT FALSE NOT NULL,
            grade INTEGER CHECK(
                grade >= 0
                AND grade <= 10
            ),
            modification timestamptz DEFAULT NOW(),
            review UUID UNIQUE,
            CONSTRAINT fk_anime_user_info_review FOREIGN KEY(review) REFERENCES anime.review(review_id)
        );
