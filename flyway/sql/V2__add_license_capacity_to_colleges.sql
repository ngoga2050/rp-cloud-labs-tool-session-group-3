-- V2: Add license capacity to colleges

ADD COLUMN license_capacity INTEGER NOT NULL DEFAULT 50;
ALTER TABLE colleges

-- Track the number of licenses currently in use
ALTER TABLE colleges
ADD COLUMN licenses_in_use INTEGER NOT NULL DEFAULT 0;

-- Ensure license values are valid
ALTER TABLE colleges
ADD CONSTRAINT chk_college_license_capacity
CHECK (license_capacity >= 0);

ALTER TABLE colleges
ADD CONSTRAINT chk_college_licenses_in_use
CHECK (
    licenses_in_use >= 0
    AND licenses_in_use <= license_capacity
);
