CREATE
    SCHEMA IF NOT EXISTS forum;

CREATE
    TYPE tag_importance AS ENUM(
        'LOW',
        'MEDIUM',
        'HIGH',
        'ADMIN'
    );

CREATE
    TYPE thread_status AS ENUM(
        'OPEN',
        'CLOSED'
    );

CREATE
    TABLE
        IF NOT EXISTS forum.Category(
            category_id UUID NOT NULL UNIQUE CONSTRAINT pk_category PRIMARY KEY,
            name VARCHAR(45) NOT NULL UNIQUE,
            description VARCHAR(150)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.Tag(
            tag_id UUID NOT NULL UNIQUE CONSTRAINT pk_tag PRIMARY KEY,
            name VARCHAR(45) NOT NULL UNIQUE,
            importance tag_importance NOT NULL,
            color VARCHAR(18)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.Thread(
            thread_id UUID NOT NULL UNIQUE CONSTRAINT pk_thread PRIMARY KEY,
            title VARCHAR(80) NOT NULL UNIQUE,
            text VARCHAR(600) NOT NULL UNIQUE,
            status thread_status NOT NULL DEFAULT 'CLOSED',
            creation timestamptz DEFAULT NOW(),
            modification timestamptz DEFAULT NOW(),
            category UUID NOT NULL,
            creator UUID NOT NULL,
            CONSTRAINT fk_category_thread FOREIGN KEY(category) REFERENCES forum.Category(category_id)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.Thread_Tags(
            thread_id UUID NOT NULL UNIQUE,
            tag_id UUID NOT NULL UNIQUE,
            CONSTRAINT pk_thread_tags PRIMARY KEY(
                thread_id,
                tag_id
            ),
            CONSTRAINT fk_thread_thread_tags FOREIGN KEY(thread_id) REFERENCES forum.Thread(thread_id),
            CONSTRAINT fk_tag_thread_tags FOREIGN KEY(tag_id) REFERENCES forum.Tag(tag_id)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.Thread_User_Status(
            user_id UUID NOT NULL UNIQUE,
            thread_id UUID NOT NULL UNIQUE,
            CONSTRAINT pk_thread_user_status PRIMARY KEY(
                user_id,
                thread_id
            ),
            watching bool NOT NULL DEFAULT FALSE,
            blocked bool NOT NULL DEFAULT FALSE,
            CONSTRAINT fk_thread_thread_user_status FOREIGN KEY(thread_id) REFERENCES forum.Thread(thread_id)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.Post(
            post_id UUID NOT NULL UNIQUE CONSTRAINT pk_post PRIMARY KEY,
            title VARCHAR(45) NOT NULL UNIQUE,
            text VARCHAR(600) NOT NULL UNIQUE,
            is_blocked bool DEFAULT FALSE,
            nr_upvote INTEGER DEFAULT 0 CHECK(
                nr_upvote >= 0
            ),
            nr_downvote INTEGER DEFAULT 0 CHECK(
                nr_downvote >= 0
            ),
            creation timestamptz DEFAULT NOW(),
            modification timestamptz DEFAULT NOW(),
            thread UUID NOT NULL,
            creator UUID NOT NULL,
            CONSTRAINT fk_thread_post FOREIGN KEY(thread) REFERENCES forum.Thread(thread_id)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.Post_User_Status(
            user_id UUID NOT NULL UNIQUE,
            post_id UUID NOT NULL UNIQUE,
            CONSTRAINT pk_post_user_status PRIMARY KEY(
                user_id,
                post_id
            ),
            is_liked bool NOT NULL DEFAULT FALSE,
            is_disliked bool NOT NULL DEFAULT FALSE,
            is_reported bool NOT NULL DEFAULT FALSE,
            CONSTRAINT fk_post_post_user_status FOREIGN KEY(post_id) REFERENCES forum.Post(post_id)
        );
