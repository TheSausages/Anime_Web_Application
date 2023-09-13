CREATE
    SCHEMA IF NOT EXISTS anime;

CREATE
    OR REPLACE VIEW anime.Review_View AS SELECT
        rv.review_id,
        rv.anime_id,
        rv.title,
        rv.text,
        COUNT( rvo.is_liked ) FILTER(
        WHERE
            rvo.is_liked
        ) AS nr_liked,
        COUNT( rvo.is_disliked ) FILTER(
        WHERE
            rvo.is_disliked
        ) AS nr_disliked,
        COUNT( rvo.is_reported ) FILTER(
        WHERE
            rvo.is_reported
        ) AS nr_reported,
        rv.modification
    FROM
        anime.Review rv
    INNER JOIN anime.Review_Opinions rvo ON
        rv.review_id = rvo.review_id
    GROUP BY
        rv.review_id
