
with pond as (
    select st_setsrid(st_point(4.3815,51.9867),4326) as pond_lonlat
    , st_transform(st_setsrid(st_point(4.3815,51.9867),4326),28992) as pond_rd
)
, data as (
    select m.meetpunt_code_oud as location, m.datum, p.parameter_code, p.parameter_omschrijving as substance, waarden
    , l.geom
    , round(l.geom <-> pond.pond_rd) as distance_from_pond
    -- , h.hoedanigheid_code, h.hoedanigheid_omschrijving, e.eenheid_code, e.eenheid_omschrijving
    from public.metingen m
    join public.parameter p on p.parameter_id=m.parameter_id
    join public.hoedanigheid h on h.hoedanigheid_id=m.hoedanigheid_id
    join public.eenheid e on e.eenheid_id=m.eenheid_id
    join public.locatie l on l.meetpunt_code_2022=m.meetpunt_code_2022
    join pond on 1=1
    -- within 10 km radius
    where l.geom <-> pond.pond_rd < 10000
    -- close to Deltares:
    -- where meetpunt_code_2022 in ('15_OW221A000','15_OW221A007','15_ZPD_ZE1ab_EL1')
    -- since 2020:
    and m.datum >= '2020-01-01'
    and p.parameter_code in ('Cr')
    and p.parameter_code in ('Zn','Pb','Ni','Cu','Cr','Cd')
)
, value_per_loc as (
    -- one value per location, per substance
    select location, distance_from_pond, substance
    -- , first_value(waarden) over (partition by location order by datum desc) as value
    , avg(waarden)::decimal(9,3) as value
    from data d
    group by location, distance_from_pond,  substance
)
select *
, ntile(3) over (partition by substance order by value) as color
from value_per_loc
;
