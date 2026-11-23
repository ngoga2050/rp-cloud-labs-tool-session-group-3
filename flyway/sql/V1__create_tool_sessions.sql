-- 1. Create colleges table
CREATE TABLE colleges (
    college_id BIGSERIAL PRIMARY KEY,
    college_name VARCHAR(150) NOT NULL,
    parent_college_id BIGINT REFERENCES colleges(college_id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create students table
CREATE TABLE students (
    student_id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    college_id BIGINT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_student_college
        FOREIGN KEY (college_id)
        REFERENCES colleges(college_id)
        ON DELETE RESTRICT
);
