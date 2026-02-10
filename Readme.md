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

### Количество проданных сосисок за каждый день предыдущей недели (timing is on)
```sql
SELECT o.date_created, SUM(op.quantity)
FROM orders AS o
JOIN order_product AS op ON o.id = op.order_id
WHERE o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY o.date_created;

date_created | sum  
--------------+------
 2026-02-08   |  748
 2026-02-05   |  991
 2026-02-04   |  988
 2026-02-06   | 1108
 2026-02-09   |  952
 2026-02-10   |  806
 2026-02-07   |  719
(7 rows)

Time: 91.303 ms
```
### Результат оптимизации (добавления индексов):
```sql
 date_created | sum  
--------------+------
 2026-02-10   | 8218
 2026-02-07   | 9920
 2026-02-06   | 9960
 2026-02-04   | 8609
 2026-02-08   | 8793
 2026-02-05   | 9142
 2026-02-09   | 9985
(7 rows)

Time: 49.527 ms
```
Разница в 9 раз