-- Recyclable and Low Fat Products
select product_id
from Products
where
    low_fats = 'Y'
    and recyclable = 'Y';

-- Big Countries
select name, population, area
from World
where
    area >= 3000000
    or population >= 25000000;

-- Find Customer Referee
SELECT name
FROM Customer
WHERE
    referee_id != 2
    OR referee_id IS NULL;