CREATE TABLE question (
    question_id SERIAL NOT NULL,
    name text UNIQUE,
    question_content text NOT NULL,
    iframe_url text NOT NULL,
    input text [] NOT NULL,
    output text [] NOT NULL,
    hint text NOT NULL DEFAULT 'ヒントはありません。',
    difficulty VARCHAR(10) DEFAULT 'NONE',
    basename text DEFAULT '',
    commentary text DEFAULT '',
    endline int DEFAULT 0,
    PRIMARY KEY (question_id)
);
CREATE TABLE submit (
    response_id SERIAL NOT NULL,
    student_id text NOT NULL,
    question_id int NOT NULL,
    result text NOT NULL,
    source text NOT NULL,
    readhint INT NOT NULL DEFAULT 0,
    submitted_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (response_id),
    FOREIGN KEY (question_id) REFERENCES question (question_id)
);
CREATE TABLE modelanswer (
    question_id int NOT NULL,
    source text NOT NULL,
    PRIMARY KEY (question_id)
);
INSERT INTO question (
        question_id,
        name,
        question_content,
        iframe_url,
        input,
        output,
        hint,
        endline
    )
VALUES (
        1,
        '第1問',
        '偶奇判定',
        'https://paiza.io/projects/e/cae8clhfoiYaD03ZH5xuZw?theme=twilight',
        '{ "5","2","14444" }',
        '{ "Odd","Even","Even" }',
        '',
        2
    ),
    (
        2,
        '第2問',
        '回文判定',
        'https://paiza.io/projects/e/cae8clhfoiYaD03ZH5xuZw?theme=twilight',
        '{ "noon","moon","level" }',
        '{ "Yes","No","Yes"}',
        '',
        2
    );