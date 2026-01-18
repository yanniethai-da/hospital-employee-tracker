-- ============================================
-- no_of_employee_in_cte.sql
-- Method: v2 with refined code
-- Project: Hospital Employee IN/OUT Tracker
-- Given a log of in and out events, that really means:
-- - Every in increases their “inside count”
-- - Every out decreases it
-- - If the final count > 0 → they’re inside
-- - If the final count ≤ 0 → they’re not inside
-- ============================================
with log_events as (
SELECT 
    emp_id,
    action,
    time,
    CASE
        WHEN action = 'in' THEN 1
        WHEN action = 'out' THEN - 1
    END AS delta
FROM
    hospital
),
log_point as (
select 
	emp_id, time, delta, 
    sum(delta) over (
    partition by emp_id
    order by time
    rows between unbounded preceding and current row 
    ) as log_total
from log_events
),
flag as 
(	
select 
		emp_id, time, log_total, 
        row_number() over (partition by emp_id order by time desc) as lastest_log
from log_point
) 

SELECT 
    emp_id, time
FROM
    flag
WHERE
    lastest_log = 1 AND log_total > 0
ORDER BY emp_id
;