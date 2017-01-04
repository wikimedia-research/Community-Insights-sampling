select
  user_name,
  home_wiki,
  global_edits,
  wiki,
  edits
from (
  select
    user_name,
    -- wiki relies on the DB system taking the first value in each group
    wiki as home_wiki,
    sum(edits) as global_edits
  from (
    select
      user_name,
      wiki,
      -- special case to avoid confusing choices of Wikidata as home wiki
      if(wiki = 'wikidatawiki', sum(edits) * 0.1, sum(edits)) as edits,
      bot_flag,
      max(month) as latest
    from staging.editor_month
    where
      month >= '2016-01-01' and
      month < '2017-01-01' and
      local_user_id != 0
    group by user_name, wiki
    order by user_name asc, edits desc
  ) by_wiki
  where
    ((convert(user_name using utf8) not regexp "bot\\b" and
    convert(user_name using utf8) not regexp "[ _]bot[ _]") or
    (user_name in ("Paucabot", "Niabot", "Marbot")))
  group by user_name
  having 
    global_edits >= 30 and
    max(bot_flag) = 0 and
    max(latest) >= '2016-07-01'
) global
left join (
  select
    user_name,
    wiki,
    -- special case to avoid confusing choices of Wikidata as home wiki
    if(wiki = 'wikidatawiki', sum(edits) * 0.1, sum(edits)) as edits
  from staging.editor_month
  where
    month >= '2016-01-01' and
    month < '2017-01-01'
  group by user_name, wiki
  order by user_name asc, edits desc
) by_wiki_2
using (user_name);
