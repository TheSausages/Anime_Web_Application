CREATE
    SCHEMA IF NOT EXISTS anime;

CREATE
    OR REPLACE VIEW anime.Anime_View AS SELECT
        an.anime_id,
        an.title,
        an.average_episode_length,
        (
            SELECT
                AVG( aui.grade )
            FROM
                anime.Anime_User_Info aui
            WHERE
                aui.anime_id = an.anime_id
        ) AS avg_grade,
        (
            SELECT
                COUNT( aui.is_favourite )
            FROM
                anime.Anime_User_Info aui
            WHERE
                aui.anime_id = an.anime_id
        ) AS nr_of_favourites,
        (
            SELECT
                COUNT(*)
            FROM
                anime.Anime_User_Info aui
            WHERE
                aui.anime_id = an.anime_id
                AND aui.review IS NOT NULL
        ) AS nr_of_reviews
    FROM
        anime.Anime an
