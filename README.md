# N_M_Database_Practice

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
## Configuration
* bundle exec 

## Database creation
```mysql
CREATE DATABASE 'n_m_db_practice'@'localhost';
CREATE USER 'n_m_db_practice'@'localhost';
GRANT ALL ON 'n_m_db_practice'.* TO 'n_m_db_practice'@'localhost';
```

## Database initialization
```bash
bundle exec rails db:migrate
bundle exec rails db:seed
```

## How to run the test suite
```bash
bundle exec rails spec
```

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions
