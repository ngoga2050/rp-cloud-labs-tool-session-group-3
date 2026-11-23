-- 1. Create colleges table
CREATE TABLE colleges (
    college_id BIGSERIAL PRIMARY KEY,
    college_name VARCHAR(150) NOT NULL,
    parent_college_id BIGINT REFERENCES colleges(college_id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
