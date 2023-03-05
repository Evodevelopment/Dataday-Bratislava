SELECT bid,
      COUNT(*) AS unique_users
 FROM (
   SELECT
     visitorId,
     test_group,
     event.bid
   FROM dataday_extended.event
   LEFT JOIN dataday_extended.booking
     ON booking.bid = event.bid
   GROUP BY
         visitorid,
         test_group,
         event.bid
      )
GROUP BY bid
HAVING COUNT(*) > 1
