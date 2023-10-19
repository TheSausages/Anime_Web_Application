INSERT
    INTO
        forum.category
    VALUES(
        'a452eb01-9873-4fff-b4a0-ea98c615d642'::uuid,
        'Category 1',
        'Description of Category 1'
    ),
    (
        'a5c79d23-f3b7-41cd-a609-0518502a29da'::uuid,
        'Category 2',
        'Description of Category 2'
    );

INSERT
    INTO
        forum.tag
    VALUES(
        '3d1f3479-1642-4865-8b58-6d4f37d1b9b8'::uuid,
        'Tag 1',
        'HIGH',
        'rgb(255, 0, 0)'
    ),
    (
        'fdcc1d06-10ca-407e-8c46-e306912340db'::uuid,
        'Tag 2',
        'ADMIN',
        'rgb(192, 235, 221)'
    );

INSERT
    INTO
        forum.thread
    VALUES(
        'c33de4c7-5588-435c-b825-b182cf06e2dc'::uuid,
        'Thread 1',
        'Text of Thread 1',
        'OPEN',
        now(),
        now(),
        'a452eb01-9873-4fff-b4a0-ea98c615d642'::uuid,
        '467a809a-d893-48c2-85e2-82f9ce4b1560'::uuid
    ),
    (
        '32ec1ac6-9131-45e1-87c0-7addf4079370'::uuid,
        'Thread 2',
        'Text of Thread 2',
        'CLOSED',
        now()- INTERVAL '2 DAY',
        now(),
        'a5c79d23-f3b7-41cd-a609-0518502a29da'::uuid,
        'eabc11d0-e6da-49f8-a6db-6bceb84a06bc'::uuid
    );

INSERT
    INTO
        forum.thread_tags
    VALUES(
        'c33de4c7-5588-435c-b825-b182cf06e2dc'::uuid,
        '3d1f3479-1642-4865-8b58-6d4f37d1b9b8'::uuid
    ),
    (
        'c33de4c7-5588-435c-b825-b182cf06e2dc'::uuid,
        'fdcc1d06-10ca-407e-8c46-e306912340db'::uuid
    ),
    (
        '32ec1ac6-9131-45e1-87c0-7addf4079370'::uuid,
        'fdcc1d06-10ca-407e-8c46-e306912340db'::uuid
    );

INSERT
    INTO
        forum.thread_user_status
    VALUES(
        '467a809a-d893-48c2-85e2-82f9ce4b1560'::uuid,
        '32ec1ac6-9131-45e1-87c0-7addf4079370'::uuid,
        TRUE,
        FALSE
    ),
    (
        'eabc11d0-e6da-49f8-a6db-6bceb84a06bc'::uuid,
        'c33de4c7-5588-435c-b825-b182cf06e2dc'::uuid,
        FALSE,
        TRUE
    );

INSERT
    INTO
        forum.post
    VALUES(
        'cd5d413c-a067-48b2-887a-f3b349b20f3d'::uuid,
        'Post 1',
        'Text 1',
        FALSE,
        now(),
        now(),
        'c33de4c7-5588-435c-b825-b182cf06e2dc'::uuid,
        'eabc11d0-e6da-49f8-a6db-6bceb84a06bc'::uuid,
        NULL
    ),
    (
        '77169dd0-bee4-4ca7-b0fe-16157b2cea42'::uuid,
        'Post 2',
        'Text 2',
        TRUE,
        now(),
        now(),
        'c33de4c7-5588-435c-b825-b182cf06e2dc'::uuid,
        'eabc11d0-e6da-49f8-a6db-6bceb84a06bc'::uuid,
        'cd5d413c-a067-48b2-887a-f3b349b20f3d'::uuid
    );

INSERT
    INTO
        forum.post_user_status
    VALUES(
        'eabc11d0-e6da-49f8-a6db-6bceb84a06bc'::uuid,
        'cd5d413c-a067-48b2-887a-f3b349b20f3d'::uuid,
        FALSE,
        TRUE,
        TRUE
    ),
    (
        '467a809a-d893-48c2-85e2-82f9ce4b1560'::uuid,
        '77169dd0-bee4-4ca7-b0fe-16157b2cea42'::uuid,
        FALSE,
        FALSE,
        FALSE
    );
