CREATE
    SCHEMA IF NOT EXISTS anime;

CREATE
    OR REPLACE VIEW anime.anime_view AS SELECT
        an.anime_id,
        an.title,
        an.average_episode_length,
        round(
            AVG( aui.grade ),
            2
        ) AS avg_grade,
        COUNT( aui.is_favourite ) FILTER(
        WHERE
            aui.is_favourite
        ) AS nr_of_favourites,
        COUNT( aui.review ) FILTER(
        WHERE
            aui.review IS NOT NULL
        ) AS nr_of_reviews
    FROM
        anime.Anime an
    JOIN anime.anime_user_info aui ON
        an.anime_id = aui.anime_id
    GROUP BY
        an.anime_id;
