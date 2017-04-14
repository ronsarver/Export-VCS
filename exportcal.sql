select 
 max(case when prop.key = 'DESCRIPTION' then replace(prop.value,char(10),'~') else null end) as description,
 max(case when prop.key = 'LOCATION' then replace(prop.value,char(10),'~') else null end) as location,
 max(case when prop.key = 'SEQUENCE' then replace(prop.value,char(10),'~') else null end) as sequence,
 max(case when prop.key = 'TRANSP' then replace(prop.value,char(10),'~') else null end) as transp,
 max(case when prop.key = 'URL' then replace(prop.value,char(10),'~') else null end) as url, 
 evnt.cal_id, evnt.id,  evnt.title, evnt.priority, evnt.privacy, evnt.event_stamp, 
 datetime(evnt.time_created/1000000, 'unixepoch') as time_created, 
 datetime(evnt.last_modified/1000000, 'unixepoch') as last_modified, 
 datetime(evnt.event_start/1000000, 'unixepoch') as event_start, 
 datetime(evnt.event_end/1000000, 'unixepoch') as event_end,
evnt.event_start_tz, evnt.event_end_tz
 from cal_events evnt join cal_properties prop on evnt.cal_id = prop.cal_id and evnt.id = prop.item_id
group by 
 evnt.cal_id, evnt.id, datetime(evnt.time_created/1000000, 'unixepoch'), datetime(evnt.last_modified/1000000, 'unixepoch'),
 evnt.title, evnt.priority, evnt.privacy, datetime(evnt.event_start/1000000, 'unixepoch'), datetime(evnt.event_end/1000000, 'unixepoch'),
 evnt.event_stamp, evnt.event_start_tz, evnt.event_end_tz
 order by 13,6,7;