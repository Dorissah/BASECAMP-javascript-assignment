/*The solution to section a of the bonus-1 task*/
SELECT TenantName
FROM Tenants
INNER JOIN (
	SELECT TenantID
	FROM AptTenants
	GROUP BY TenantID
	HAVING count(*)>1)c
)
ON Tenants.TenantID = c.TenantID

/*The solution to section b of the bonus-1 task*/
SELECT BuildingName, ISNULL(count,0) as 'count'
FROM Buildings
LEFT JOIN(
	SELECT Apartments.BuildingID, count(*) as 'count'
	FROM Requests INNER JOIN Apartments
ON Requests.APtId = Apartments.APtId
WHERE Requests.Status = 'Open'
GROUP BY Apartments.BuildingID) ReqCounts
ON ReqCounts.BuildingID = Buildings.BuildingID