# N_M_Database_Practice
[![CircleCI](https://circleci.com/gh/toushimi/n_m_db_practice/tree/master.svg?style=svg&circle-token=80bd565c1fda00c0a3631d6c7477162d0e20c890)](https://circleci.com/gh/toushimi/n_m_db_practice/tree/master)

N_Mのデータベース構造を持った環境の練習をするために作成した。

## Requirements
* Ruby 2.6.3 via rbenv
* MySQL 5.5 or later
* MariaDB 5.7 or later
* bundler

## Installation
```bash
git clone https://github.com/toushimi/n_m_db_practice
cd n_m_db_practice
bundle install --path="vendor/bundle"
```

## Credentials
```
EDITOR="vi" bundle exec rails credentials:edit
```

AWSのアクセスキーおよびシークレットを入力
```yaml
aws:
    access_key_id: <access_key_id>
    access_key_secret: <access_key_secret>
```

SESがサンドボックスの場合、外部へメールを送信できないため、[SES]->[Email Addresses]->[Verify a New Email Address]から許可する必要がある。

## Configuration
* bundle exec 

## Database creation
```
bundle exec db:create
```

または

```mysql
CREATE DATABASE n_m_db_practice;
CREATE USER 'n_m_db_practice'@'localhost';
GRANT ALL ON n_m_db_practice.* TO 'n_m_db_practice'@'localhost';
```

## Database initialization
```bash
bundle exec rails db:migrate
```

## How to run the test suite

```mysql
CREATE DATABASE n_m_db_practice_test;
CREATE USER 'n_m_db_practice'@'localhost';
GRANT ALL ON n_m_db_practice_test.* TO 'n_m_db_practice'@'localhost';
```

```bash
bundle exec rails db:migrate
bundle exec rails spec
```

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions
