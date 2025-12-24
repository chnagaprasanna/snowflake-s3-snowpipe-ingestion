CREATE OR REPLACE STORAGE INTEGRATION s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::XXXXXXXXXXXX:role/XXXXXXXXXXX'
  STORAGE_ALLOWED_LOCATIONS = ('s3://snowflake-db-np/snowpipe/');

-- Inspect integration details (used for AWS trust policy)
DESC STORAGE INTEGRATION s3_int;

-- Verify integration exists and is enabled
SHOW STORAGE INTEGRATIONS;
