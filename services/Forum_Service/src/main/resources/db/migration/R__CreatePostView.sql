CREATE
    SCHEMA IF NOT EXISTS forum;

CREATE
    OR REPLACE VIEW forum.post_view AS SELECT
        pt.post_id,
        pt.title,
        pt.text,
        pt.is_blocked,
        pt.creation,
        pt.modification,
        pt.thread,
        pt.creator,
        COUNT( pus.is_liked ) FILTER(
        WHERE
            pus.is_liked
        ) AS nr_liked,
        COUNT( pus.is_disliked ) FILTER(
        WHERE
            pus.is_disliked
        ) AS nr_disliked,
        COUNT( pus.is_reported ) FILTER(
        WHERE
            pus.is_reported
        ) AS nr_reported
    FROM
        forum.Post pt
    INNER JOIN forum.post_user_status pus ON
        pt.post_id = pus.post_id
    GROUP BY
        pt.post_id
