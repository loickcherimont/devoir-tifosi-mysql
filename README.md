# Tifosi database

## 🌱 About

This is a dynamic database hosted locally for Tifosi Street-Food italian restaurant.


## 🖥️ Tech stack

- **Data** : MySQL 8.4.10


## 🚀 Setup

1. Clone the repository using :

```bash
git clone https://www.github.com/loickcherimont/devoir-tifosi-mysql.git
```

2. Go in the project and fetch its working directory path

```bash
cd devoir-tifosi-mysql
pwd
```

3. Open a terminal and run MySQL Monitor using this command

```bash
mysql -u tifosi -p
```

4. The command line prompts you for a password, use `tifosi`

5. Use the `tifosi` database

```bash
USE tifosi;
```

6. To create schemas, run `schema.sql`

```bash
source [WORKING DIRECTORY PATH]/devoir-tifosi-mysql/schema.sql
```

7. You can consult all tables in tifosi database using `SHOW TABLES;` command


## ▶️ Usage

To insert test data run `data.sql`

```bash
source [WORKING DIRECTORY PATH]/devoir-tifosi-mysql/data.sql
```

To run all test requests use `test_requests.sql`  

```bash
source [WORKING DIRECTORY PATH]/devoir-tifosi-mysql/test_requests.sql
```  
  
Or you can consult each SQL requests one by one, using a monitor and the request you want to verify.

## 🔑 License

<div align="center">Copyright &copy; 2026 | Loick CHERIMONT | All Rights Reserved.</div>