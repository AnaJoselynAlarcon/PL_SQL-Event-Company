PL/SQL PROCEDURE 

📝 This repository contains SQL scripts for calculating performance-related fees for events and updating contract details accordingly. Below is a brief overview of the functions and procedures included in the repository:

func_performance_hours:

This function calculates the duration of a performance in hours based on the start and stop times provided.
func_hourly_rate:

This function determines the hourly rate for an event based on its type. Hourly rates vary depending on the type of event.
func_total_fee:

This function calculates the total fee for a performance by multiplying the performance hours by the hourly rate obtained from func_hourly_rate.
func_admin_fee:

This function calculates the total fee for a performance, considering an additional weekday fee if the performance date is not on a weekend (Saturday or Sunday).
proc_calculate_fee:

This procedure updates the fee column in the ATA_CONTRACT table with the calculated total fee for a performance. It retrieves performance details from the ATA_PERFORMANCE table, calculates the total fee using func_total_fee, and updates the contract details accordingly.
Execute the scripts in the following order:

1) create_ata.sql
2) constraints_ata.sql
3) load_ata.sql

Instructions for Use:
🔧 Ensure that you have appropriate permissions to execute functions and procedures in the database.
🚀 Run the SQL scripts in your preferred SQL environment or client.
🔍 Make necessary modifications to adapt the scripts to your specific database schema and requirements.
⚠️ Execute the scripts in the correct order to establish dependencies and ensure proper functionality.

Author:
👤 Find me on LinkedIn Ana Joselyn Alarcon
Email: anajoselynalarcon@gmail.com
