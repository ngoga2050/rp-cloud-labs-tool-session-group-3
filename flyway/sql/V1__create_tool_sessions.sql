
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

-- 3. Create tool_sessions table
CREATE TABLE tool_sessions (
    session_id BIGSERIAL PRIMARY KEY,
    student_id BIGINT NOT NULL,
    tool_name VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'REQUESTED',
    started_at TIMESTAMPTZ,
    ended_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_session_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_session_status
        CHECK (
            status IN (
                'REQUESTED',
                'ACTIVE',
                'COMPLETED',
                'CANCELLED'
            )
        ),

    CONSTRAINT chk_session_dates
        CHECK (
            ended_at IS NULL
            OR (
                started_at IS NOT NULL
                AND ended_at >= started_at
            )
        )
);
-- 4. Create indexes for faster queries
CREATE INDEX idx_students_college
    ON students(college_id);

CREATE INDEX idx_tool_sessions_student
    ON tool_sessions(student_id);

CREATE INDEX idx_tool_sessions_status
    ON tool_sessions(status);
