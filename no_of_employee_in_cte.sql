-- ============================================
-- no_of_employee_in_cte.sql
-- Method: using CTE
-- Project: Hospital Employee IN/OUT Tracker
-- Disadvantage of this method: Cant detect messy in/out logs
-- ============================================
with inout_time as
(select emp_id,
	max(case when action = 'in' then time end) as intime,
    max(case when action = 'out' then time end) as outtime

from hospital

group by emp_id)
select *
from inout_time
where intime > outtime or outtime is null
;