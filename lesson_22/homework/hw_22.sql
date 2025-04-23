create view analytics.sales_stats_vw as
select * from analytics.sales_stats;

revoke select on all tables in schema analytics from manager;

grant select on analytics.sales_stats_vw to manager;

create role senior_analyst;

grant data_analyst to senior_analyst;

grant temp on database tech_gadgets to senior_analyst;