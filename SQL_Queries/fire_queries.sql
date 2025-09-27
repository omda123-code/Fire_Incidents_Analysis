use [Fire Accidents]
select top 3 * from [Fire-Incidents]

-- Count the number of fire incidents grouped by Area_of_Origin
SELECT Area_of_Origin, COUNT(*) AS Total_Incidents
FROM [Fire-Incidents]
GROUP BY Area_of_Origin
ORDER BY Total_Incidents DESC;

-- Sum of civilian casualties for each area of origin
SELECT Area_of_Origin, SUM(Civilian_Casualties) AS Total_Casualties
FROM [Fire-Incidents]
GROUP BY Area_of_Origin
ORDER BY Total_Casualties DESC;

-- Average number of persons rescued per fire incident
SELECT Area_of_Origin, AVG(CAST(Count_of_Persons_Rescued AS FLOAT)) AS Avg_Rescued
FROM [Fire-Incidents]
GROUP BY Area_of_Origin
ORDER BY Avg_Rescued DESC;

-- Total estimated dollar loss for each property use type
SELECT Property_Use, SUM(Estimated_Dollar_Loss) AS Total_Loss
FROM [Fire-Incidents]
GROUP BY Property_Use
ORDER BY Total_Loss DESC;

-- Sum of displaced persons per incident type
SELECT Property_Use, SUM(Estimated_Number_Of_Persons_Displaced) AS Total_Displaced
FROM [Fire-Incidents]
GROUP BY Property_Use
ORDER BY Total_Displaced DESC;

-- Count incidents where fire alarm system helped evacuation
SELECT Fire_Alarm_System_Operation, COUNT(*) AS Total_Incidents
FROM [Fire-Incidents]
GROUP BY Fire_Alarm_System_Operation
ORDER BY Total_Incidents DESC;

-- Calculate average duration to bring fire under control
SELECT Area_of_Origin,
       AVG(DATEDIFF(MINUTE, TFS_Alarm_Time, Fire_Under_Control_Time)) AS Avg_Minutes_To_Control
FROM [Fire-Incidents]
GROUP BY Area_of_Origin
ORDER BY Avg_Minutes_To_Control ASC;

-- Count the number of incidents per ignition source
SELECT Ignition_Source, COUNT(*) AS Incidents_Count
FROM [Fire-Incidents]
GROUP BY Ignition_Source
ORDER BY Incidents_Count DESC;

-- Count fire status on TFS arrival
SELECT Status_of_Fire_On_Arrival, COUNT(*) AS Incidents_Count
FROM [Fire-Incidents]
GROUP BY Status_of_Fire_On_Arrival
ORDER BY Incidents_Count DESC;

-- Most common materials ignited first in incidents
SELECT Material_First_Ignited, COUNT(*) AS Incident_Count
FROM [Fire-Incidents]
GROUP BY Material_First_Ignited
ORDER BY Incident_Count DESC;

-- Find total estimated loss and casualties correlation
SELECT SUM(Estimated_Dollar_Loss) AS Total_Loss, SUM(Civilian_Casualties) AS Total_Casualties
FROM [Fire-Incidents];

-- Count incidents by property type and whether a smoke alarm was present
SELECT Property_Use, Smoke_Alarm_at_Fire_Origin_Alarm_Failure, COUNT(*) AS Incidents
FROM [Fire-Incidents]
GROUP BY Property_Use, Smoke_Alarm_at_Fire_Origin_Alarm_Failure
ORDER BY Incidents DESC;







