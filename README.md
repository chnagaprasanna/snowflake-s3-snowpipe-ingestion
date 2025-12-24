<h2 align="center">
  Snowflake S3 Snowpipe Auto-Ingestion Pipeline <br/>
  <a href="https://github.com/prasanna-chintamaneni" target="_blank">
    By Naga Prasanna Chintamaneni
  </a>
</h2>

<p align="center">
  <img src="<img width="1365" height="655" alt="snowpipe_architecture" src="https://github.com/user-attachments/assets/47972e91-b41c-420a-abf3-b283c7447a1e" />
"
       alt="Snowflake S3 Snowpipe Architecture"
       width="100%"/>
</p>

<br/>

## 📌 Project Overview  

This project demonstrates an **end-to-end automated data ingestion pipeline** using  
**Snowflake, AWS S3, and Snowpipe**.

CSV files uploaded to an **AWS S3 bucket** are **automatically ingested into Snowflake tables**
using **Snowpipe (AUTO_INGEST)** without any manual intervention.

The project focuses on:
- Secure Snowflake–AWS integration using **IAM role-based access**
- Event-driven ingestion using **Snowpipe**
- Production-ready Snowflake architecture

---

## 🚀 Built With  

- **Snowflake**
- **AWS S3**
- **AWS IAM (Role & Trust Policy)**
- **Snowflake Storage Integration**
- **Snowflake External Stage**
- **Snowpipe**
- **SQL**
- **VS Code**
- **GitHub**

---

## 🏗 Architecture  

AWS S3 (CSV Files)
↓
Snowflake Storage Integration (IAM Role + External ID)
↓
External Stage
↓
Snowpipe (AUTO_INGEST = TRUE)
↓
Snowflake Target Table

<img width="1365" height="655" alt="snowpipe_architecture" src="https://github.com/user-attachments/assets/61bf57c0-e40d-40ff-a596-fd8cf75d1eb0" />



---

## 📁 Project Structure  

```bash
snowflake-s3-snowpipe-ingestion/
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_file_format.sql
│   ├── 03_storage_integration.sql
│   ├── 04_external_stage.sql
│   └── 05_snowpipe.sql
│
├── aws/
│   ├── iam_role_trust_policy.json
│   └── s3_bucket
│
├── diagrams/
│   └── architecture.png
│
└── README.md

##⚙️ Step-by-Step Implementation

###1️⃣ Create Target Table
Create the Snowflake table where data will be loaded.

###2️⃣ Create File Format
Defines how Snowflake reads CSV files.

###3️⃣ Create Storage Integration
Allows Snowflake to securely access S3 using IAM roles (no AWS keys).

Inspect integration details:
'''bash
DESC STORAGE INTEGRATION s3_int;
SHOW STORAGE INTEGRATIONS;
'''

###4️⃣ Configure AWS IAM Role
Create an IAM Role in AWS
Update Trust Policy using values from:
'''bash
DESC STORAGE INTEGRATION s3_int;
'''
###5️⃣ Create External Stage
Points Snowflake to the S3 location.
Validate:
'''bash
LIST @MANAGE_DB.EXTERNAL_STAGES.csv_folder;
'''

###6️⃣ Create Snowpipe
Automatically loads data when new files arrive in S3.
Check pipe status:
'''bash
DESC PIPE MANAGE_DB.PIPES.employee_pipe;
'''

###7️⃣ Upload CSV Files to S3
Snowpipe automatically ingests the data.

###8️⃣ Validate Loaded Data
'''bash
SELECT * FROM first_db.public.employees;
'''

##✅ Best Practices Followed

IAM role-based secure access

External ID for confused-deputy protection

No static AWS credentials

Event-driven ingestion with Snowpipe

Modular and reusable SQL scripts

##🧠 Key Learnings

Secure Snowflake–AWS integration using Storage Integrations

External Stages for cloud storage access

Real-time ingestion using Snowpipe

Production-grade Snowflake ingestion design
