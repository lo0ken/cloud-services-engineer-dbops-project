# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

## SQL запросы
### Добавление пользователя с привилегиями
```sql
CREATE USER autotest WITH PASSWORD 'password';

GRANT ALL PRIVILEGES ON DATABASE store TO autotest;
GRANT ALL ON SCHEMA public TO autotest;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO autotest;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO autotest;
```