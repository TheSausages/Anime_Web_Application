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
        IF NOT EXISTS forum.category(
            category_id UUID NOT NULL UNIQUE CONSTRAINT pk_category PRIMARY KEY,
            name VARCHAR(45) NOT NULL UNIQUE CHECK(
                TRIM( name )!= ''
            ),
            description VARCHAR(150)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.tag(
            tag_id UUID NOT NULL UNIQUE CONSTRAINT pk_tag PRIMARY KEY,
            name VARCHAR(45) NOT NULL UNIQUE CHECK(
                TRIM( name )!= ''
            ),
            importance tag_importance NOT NULL,
            color VARCHAR(18)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.thread(
            thread_id UUID NOT NULL UNIQUE CONSTRAINT pk_thread PRIMARY KEY,
            title VARCHAR(80) NOT NULL UNIQUE CHECK(
                TRIM( title )!= ''
            ),
            text VARCHAR(600) NOT NULL UNIQUE CHECK(
                TRIM( text )!= ''
            ),
            status thread_status NOT NULL DEFAULT 'CLOSED',
            creation timestamptz DEFAULT NOW(),
            modification timestamptz DEFAULT NOW(),
            category UUID NOT NULL,
            creator UUID NOT NULL,
            CONSTRAINT fk_category_thread FOREIGN KEY(category) REFERENCES forum.category(category_id)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.thread_tags(
            thread_id UUID NOT NULL UNIQUE,
            tag_id UUID NOT NULL UNIQUE,
            CONSTRAINT pk_thread_tags PRIMARY KEY(
                thread_id,
                tag_id
            ),
            CONSTRAINT fk_thread_thread_tags FOREIGN KEY(thread_id) REFERENCES forum.thread(thread_id),
            CONSTRAINT fk_tag_thread_tags FOREIGN KEY(tag_id) REFERENCES forum.tag(tag_id)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.thread_user_status(
            user_id UUID NOT NULL,
            thread_id UUID NOT NULL,
            CONSTRAINT pk_thread_user_status PRIMARY KEY(
                user_id,
                thread_id
            ),
            is_watching bool NOT NULL DEFAULT FALSE,
            is_blocked bool NOT NULL DEFAULT FALSE,
            CONSTRAINT fk_thread_thread_user_status FOREIGN KEY(thread_id) REFERENCES forum.thread(thread_id)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.post(
            post_id UUID NOT NULL UNIQUE CONSTRAINT pk_post PRIMARY KEY,
            title VARCHAR(45) NOT NULL UNIQUE,
            text VARCHAR(600) NOT NULL,
            is_blocked bool DEFAULT FALSE,
            creation timestamptz DEFAULT NOW(),
            modification timestamptz DEFAULT NOW(),
            thread UUID NOT NULL,
            creator UUID NOT NULL,
            answer_to UUID CHECK ( answer_to != post_id ),
            CONSTRAINT fk_postresponses_response foreign key (answer_to) references forum.post(post_id),
            CONSTRAINT fk_thread_post FOREIGN KEY(thread) REFERENCES forum.thread(thread_id)
        );

CREATE
    TABLE
        IF NOT EXISTS forum.post_user_status(
            user_id UUID NOT NULL,
            post_id UUID NOT NULL,
            CONSTRAINT pk_post_user_status PRIMARY KEY(
                user_id,
                post_id
            ),
            is_liked bool NOT NULL DEFAULT FALSE,
            is_disliked bool NOT NULL DEFAULT FALSE,
            is_reported bool NOT NULL DEFAULT FALSE,
            CONSTRAINT fk_post_post_user_status FOREIGN KEY(post_id) REFERENCES forum.post(post_id)
        );
