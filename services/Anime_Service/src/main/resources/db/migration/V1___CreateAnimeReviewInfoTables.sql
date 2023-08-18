CREATE
    SCHEMA IF NOT EXISTS anime;

CREATE
    TABLE
        IF NOT EXISTS anime.Anime(
            anime_id UUID NOT NULL UNIQUE CONSTRAINT pk_anime PRIMARY KEY,
            average_episode_length INTEGER DEFAULT 25
        );

CREATE
    TABLE
        IF NOT EXISTS anime.Review(
            review_id UUID NOT NULL UNIQUE CONSTRAINT pk_review PRIMARY KEY,
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
            modification timestamptz NOT NULL DEFAULT NOW()
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
        anime.Anime_User_Info(
            anime_id UUID NOT NULL UNIQUE CONSTRAINT fk_anime_anime_user_info REFERENCES anime.Anime(anime_id),
            user_id UUID NOT NULL UNIQUE,
            CONSTRAINT pk_anime_user_info PRIMARY KEY(
                anime_id,
                user_id
            ),
            status status NOT NULL,
            watch_start_date DATE,
            watch_end_date DATE,
            nr_episodes_seen INTEGER DEFAULT 0 NOT NULL,
            is_favourite BOOLEAN DEFAULT FALSE NOT NULL,
            modification_date timestamptz DEFAULT NOW(),
            review UUID UNIQUE,
            CONSTRAINT fk_anime_user_info_review FOREIGN KEY(review) REFERENCES anime.Review(review_id)
        );
