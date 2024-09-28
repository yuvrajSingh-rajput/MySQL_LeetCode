-- PROBLEM STATEMENT(180): Table: Logs

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column starting from 1.
 

-- Find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

-- The result format is in the following example.

-- Example 1:

-- Input: 
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
-- Output: 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- Explanation: 1 is the only number that appears consecutively for at least three times.



--METHOD 1: If the id's are not consecutive
SELECT DISTINCT L1.num AS "ConsecutiveNums" 
FROM 
(SELECT num, ROW_NUMBER() OVER (ORDER BY id) AS RL1 FROM Logs) L1,
(SELECT num, ROW_NUMBER() OVER (ORDER BY id) AS RL2 FROM Logs) L2,
(SELECT num, ROW_NUMBER() OVER (ORDER BY id) AS RL3 FROM Logs) L3
WHERE L1.RL1 = L2.RL2 - 1
AND L2.RL2 = L3.RL3 - 1
AND L1.num = L2.num
AND L2.num = L3.num;

-- METHOD 2: If id's are consecutive
SELECT DISTINCT l1.Num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l2.Id = l1.Id + 1 AND l2.Num = l1.Num
JOIN Logs l3 ON l3.Id = l2.Id + 1 AND l3.Num = l2.Num;
