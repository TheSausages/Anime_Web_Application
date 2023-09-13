INSERT
    INTO
        anime.anime
    VALUES(
        '6119cf4c-a2b7-4633-a455-f837e6017e8b'::uuid,
        'X',
        25
    ),
    (
        '7f6366ad-2187-481a-bfec-e0357e2cb14c'::uuid,
        'X2',
        10
    );

INSERT
    INTO
        anime.review
    VALUES(
        '5b7152d0-2b5f-4a93-8b5b-5c63e4872312'::uuid,
        '6119cf4c-a2b7-4633-a455-f837e6017e8b'::uuid,
        'Review nr. 1',
        '10/10 would recommend',
        CURRENT_DATE - 3
    ),
    (
        '5f114b4e-f02d-4c1d-9889-9ac97eacb454'::uuid,
        '6119cf4c-a2b7-4633-a455-f837e6017e8b'::uuid,
        'Review nr. 3',
        '8/10 would probably recommend',
        CURRENT_DATE - 4
    ),
    (
        '8baba8e7-f26c-4d4c-ae6b-6a4b13fe5c73'::uuid,
        '7f6366ad-2187-481a-bfec-e0357e2cb14c'::uuid,
        'Review nr. 2',
        '4/10 would not recommend',
        CURRENT_DATE - 6
    );

;

INSERT
    INTO
        anime.review_opinions
    VALUES(
        '5b7152d0-2b5f-4a93-8b5b-5c63e4872312'::uuid,
        'eabc11d0-e6da-49f8-a6db-6bceb84a06bc'::uuid,
        TRUE,
        FALSE,
        FALSE
    ),
    (
        '5b7152d0-2b5f-4a93-8b5b-5c63e4872312'::uuid,
        'fe054814-61ba-42c8-85e7-603fe6693dab'::uuid,
        TRUE,
        FALSE,
        FALSE
    ),
    (
        '8baba8e7-f26c-4d4c-ae6b-6a4b13fe5c73'::uuid,
        'eabc11d0-e6da-49f8-a6db-6bceb84a06bc'::uuid,
        FALSE,
        TRUE,
        TRUE
    );

INSERT
    INTO
        anime.anime_user_info
    VALUES(
        '6119cf4c-a2b7-4633-a455-f837e6017e8b'::uuid,
        '467a809a-d893-48c2-85e2-82f9ce4b1560'::uuid,
        'COMPLETED',
        CURRENT_DATE - 5,
        CURRENT_DATE - 3,
        12,
        TRUE,
        10,
        CURRENT_DATE - 3,
        '5b7152d0-2b5f-4a93-8b5b-5c63e4872312'::uuid
    ),
    (
        '6119cf4c-a2b7-4633-a455-f837e6017e8b'::uuid,
        'eabc11d0-e6da-49f8-a6db-6bceb84a06bc'::uuid,
        'COMPLETED',
        CURRENT_DATE - 6,
        CURRENT_DATE - 4,
        12,
        TRUE,
        8,
        CURRENT_DATE - 4,
        '5f114b4e-f02d-4c1d-9889-9ac97eacb454'::uuid
    ),
    (
        '7f6366ad-2187-481a-bfec-e0357e2cb14c'::uuid,
        'eabc11d0-e6da-49f8-a6db-6bceb84a06bc'::uuid,
        'WATCHING',
        CURRENT_DATE - 5,
        NULL,
        5,
        FALSE,
        NULL,
        CURRENT_DATE - 4,
        NULL
    ),
    (
        '7f6366ad-2187-481a-bfec-e0357e2cb14c'::uuid,
        '467a809a-d893-48c2-85e2-82f9ce4b1560'::uuid,
        'DROPPED',
        CURRENT_DATE - 7,
        CURRENT_DATE - 6,
        8,
        FALSE,
        4,
        CURRENT_DATE - 6,
        '8baba8e7-f26c-4d4c-ae6b-6a4b13fe5c73'::uuid
    );
