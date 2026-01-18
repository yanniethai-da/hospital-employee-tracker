# hospital-employee-tracker
SQL Project — Realistic Badge Swipe Analysis
This project simulates a real hospital badge‑swipe system and answers a deceptively simple question:
“Which employees are currently inside the hospital?”
The dataset includes messy, real‑world scenarios such as missing swipes, out‑of‑order logs, overnight shifts, and badge errors. The project walks through multiple solution versions, showing how SQL logic evolves from simple aggregation to robust, sequence‑aware analysis.

Project Overview
Modern access‑control systems rely on badge swipes to track employee movement. But real logs are rarely clean. Employees forget to swipe, badge readers glitch, and events arrive out of order.
This project explores how to process such data using SQL, focusing on:
- Data quality challenges
- IN/OUT event pairing
- Window functions
- Running totals
- Error‑tolerant logic
- Clear documentation and reasoning

 Dataset
The dataset (hospital.sql) includes realistic scenarios:
- Normal IN/OUT cycles
- Missing OUT events (employee still inside)
- OUT before IN (messy logs)
- Multiple INs without OUTs
- Overnight shifts
- Employees who only OUT (never inside)
- Badge reader errors
This variety forces the logic to be robust and sequence‑aware, not just based on simple aggregation.

Version 1 — Baseline Logic (MAX IN/OUT)
Approach:
Use MAX(in) and MAX(out) per employee to determine who is inside.
Strengths:
- Simple
- Works for clean data
Limitations:
- Fails on messy logs
- Cannot detect OUT-before-IN
- Cannot detect multiple INs in a row
- Cannot detect badge errors
- Overnight shifts break the logic

Version 2 — Refined Logic (Window Functions)
To handle real‑world data, the logic must consider event order, not just max timestamps.
Key idea:
- Every IN = +1
- Every OUT = –1
- Running total tracks occupancy
- Final total > 0 → employee is inside
This method handles messy logs far more gracefully.
✔ SQL Concepts Used
- Window functions
- Running totals
- CTE structuring
- Event deltas
- Last‑event detection

What I Learned
- Why simple aggregation fails with messy data
- How window functions enable sequence‑aware logic
- How to design SQL that handles edge cases
- The importance of documenting assumptions
- How to structure SQL projects for portfolio use
- How to communicate logic clearly for others to learn

 Future Enhancements
- Error classification (missing OUT, messy logs, badge errors)
- IN/OUT pairing using row numbers
- Recursive CTE version
- Occupancy timeline visualization
- Dashboard in Power BI or Excel
- Anomaly detection for suspicious patterns

Connect With Me
If you’re working on SQL, data cleaning, or real‑world logic problems, feel free to reach out. I love sharing ideas and learning from others.
