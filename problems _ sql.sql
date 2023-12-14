use marketing

-- 1> . Who prefers energy drink more? (male/female/non-binary?)
select gender,count(respondent_id) from dim_repondents
group by gender

-- 2> Which age group prefers energy drinks more?

select age, count( distinct respondent_id) as total from dim_repondents
group by age
order by total desc

-- 3>. Which type of marketing reaches the most Youth (15-30)?
select * from dim_repondents
select * from fact_survey_responses
select  f.marketing_channels , count(d.age) as total
from dim_repondents as d join fact_survey_responses as f 
on d.respondent_id = f.respondent_id
where d.age in ("15-18","19-30")
group by f.marketing_channels 
order by total desc

-- 4> . What are the preferred ingredients of energy drinks among respondent
 select ingredients_expected ,count(distinct respondent_id) as total
 from fact_survey_responses
 group by 1
 order by total desc
 
 -- 5>  What packaging preferences do respondents have for energy drinks?
 
 select Packaging_preference ,count(distinct respondent_id) as total
 from fact_survey_responses
 group by 1
 order by total desc
 
-- 6> . Who are the current market leaders?
 select current_brands ,count(distinct respondent_id) as total
 from fact_survey_responses
 group by 1
 order by total desc
 
 -- 7> What are the primary reasons consumers prefer those brands over ours?
 
select * from fact_survey_responses
 select reasons_for_choosing_brands ,count(distinct respondent_id) as total
 from fact_survey_responses
 group by 1
 order by total desc
 
 -- 8>  Which marketing channel can be used to reach more customers?
 select marketing_channels,count(distinct response_id) as total_customer
 from fact_survey_responses
 group by 1
 order by total_customer desc
 limit 1
 
 -- 9> What do people think about our brand? (overall rating)
 
 select current_brands, avg(taste_experience) as total_rating
 from fact_survey_responses
 where current_brands="codex"
 group by 1
 
-- 10> Which cities do we need to focus more on
select * from dim_cities
select * from dim_repondents

select c.city,count(distinct respondent_id) as total_respondent
from dim_cities as c join dim_repondents as r using(city_id)
group by 1
order by total_respondent
limit 2

-- 11>Where do respondents prefer to purchase energy drinks

select purchase_location , count(response_id) as total
from fact_survey_responses
group by 1
order by total desc
limit 1

-- 12> What are the typical consumption situations for energy drinks among respondents

 select * from fact_survey_responses
 select distinct typical_consumption_situations
 from fact_survey_responses
 
 
 