--total fee calculation = hours * fee
--weekDayAddFee = 100;
--declare variables for type of event
-- calculate hoursPerformed = endTime - startTime


-- o	func_performance_hours*  (5 marks)
-- o	func_hourly_rate  (5 marks)
-- o	func_total_fee  (5 marks)
-- o	func_admin_fee  (5 marks)
-- o	proc_calculate_fee  (5 marks)



CREATE OR REPLACE FUNCTION func_performance_hours
(p_start_time  DATE, p_stop_time DATE)
RETURN NUMBER
IS

v_performance_hours NUMBER;

BEGIN
    

    v_performance_hours = p_stop_time - p_start_time;

    RETURN v_performance_hours;

END;
/











/*FUNCTION HOURLY RATE*/

CREATE OR REPLACE FUNCTION func_hourly_rate
(p_event_type VARCHAR2) RETURN NUMBER
IS

v_event_type VARCHAR2;
v_hourly_rate NUMBER;

BEGIN

    v_event_type := UPPER(p_event_type);
    -- Set the hourly rate based on the event type
    CASE v_event_type
        WHEN 'CHILDRENS PARTY' THEN
        v_hourly_rate := 335;
        WHEN 'CONCERT' THEN
        v_hourly_rate := 1000;
        WHEN 'DIVORCE PARTY' THEN
        v_hourly_rate := 170;
        WHEN 'WEDDING' THEN
        v_hourly_rate := 300;
        ELSE
        v_hourly_rate := 100;
    END CASE;

    RETURN v_hourly_rate;

END;
/









-- func_total_fee  (5 marks)
CREATE OR REPLACE FUNCTION func_total_fee
(p_start_time DATE, p_stop_time DATE, p_event_type VARCHAR2) RETURN NUMBER
IS
    v_performance_hours NUMBER;
    v_hourly_rate NUMBER;
    v_total_fee NUMBER;



BEGIN
    -- Call func_performance_hours to calculate the performance hours
    v_performance_hours := func_performance_hours(p_start_time, p_stop_time);

    -- Call func_hourly_rate to retrieve the hourly rate based on the event type
    v_hourly_rate := func_hourly_rate(p_event_type);

    -- Calculate the total fee
    v_total_fee := v_performance_hours * v_hourly_rate;

    RETURN v_total_fee;

    
END;
/









/*func_admin_fee */
CREATE OR REPLACE FUNCTION func_admin_fee
(p_start_time DATE, p_stop_time DATE, p_event_type VARCHAR2, p_performance_date DATE) 
RETURN NUMBER
IS
    v_performance_hours NUMBER;
    v_hourly_rate NUMBER;
    v_total_fee NUMBER;
    c_weekday_fee CONSTANT NUMBER := 100;

BEGIN
    -- Call func_performance_hours to calculate the performance hours
    v_performance_hours := func_performance_hours(p_start_time, p_stop_time);

    -- Call func_hourly_rate to retrieve the hourly rate based on the event type
    v_hourly_rate := func_hourly_rate(p_event_type);

    -- Calculate the total fee
    v_total_fee := v_performance_hours * v_hourly_rate;

    IF(TO_CHAR(p_performance_date, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') = 'SAT' OR TO_CHAR(p_performance_date, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') = 'SUN') THEN
        v_total_fee := v_total_fee;

    ELSE
        v_total_fee := v_total_fee + c_weekday_fee;
    
    END IF;

    RETURN v_total_fee;

END;
/

        







/*proc_calculate_fee 
--It stores the calculated total fee 
in the ATA_CONTRACT table's FEE column for the corresponding contract. */
CREATE OR REPLACE PROCEDURE proc_calculate_fee
(p_start_time DATE, p_stop_time DATE, p_event_type VARCHAR2, p_performance_date DATE)
IS
    v_start_time DATE;
    v_stop_time DATE;

    v_event_type VARCHAR2(20);

    v_performance_hours NUMBER;
    v_hourly_rate NUMBER;
    v_total_fee NUMBER;
    c_weekday_fee CONSTANT NUMBER := 100;

BEGIN
-- Retrieve performance details from ATA_PERFORMANCE table
    SELECT Start_time, Stop_time
    INTO v_start_time, v_stop_time
    FROM ATA_PERFORMANCE
    WHERE Contract_number = p_contract_number
    AND performance_date = p_performance_date;
    


    -- Call func_performance_hours to calculate the performance hours
    v_performance_hours := func_performance_hours(v_start_time, v_stop_time);




-- Retrieve event type based on contract number
    SELECT event_type
    INTO v_event_type
    FROM ATA_CONTRACT
    WHERE Contract_number = p_contract_number;

    -- Call func_hourly_rate to retrieve the hourly rate based on the event type
    v_hourly_rate := func_hourly_rate(v_event_type);

    -- Calculate the total fee
    v_total_fee := v_performance_hours * v_hourly_rate;

    -- Check if it is on the weekend
    IF(TO_CHAR(p_performance_date, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') = 'SAT' OR TO_CHAR(p_performance_date, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') = 'SUN') THEN
        v_total_fee := v_total_fee;

    ELSE
        v_total_fee := v_total_fee + c_weekday_fee;
    
    END IF;

--MAIN FUNCTIONALITY Update
    UPDATE ATA_CONTRACT
    SET Fee = v_total_fee
    WHERE Contract_number = p_contract_number;

    COMMIT;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found');

        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Something went wrong');
END;
/

