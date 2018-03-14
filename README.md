This repository contains the code used to distribute the Wikimedia Foundation's [Community Engagement Insights annual survey](https://meta.wikimedia.org/wiki/Community_Engagement_Insights/Annual_surveys) to a sample of Wikimedia project contributors.

## Sampling strategy for the 2017-18 survey

We want to survey **recent, recurring active editors** on Wikimedia projects. Therefore, we define our population as users who were [active editors](https://meta.wikimedia.org/wiki/Research:Active_editor) in at least 2 of the past 3 months: registered, non-bot editors with at least 5 content edits across all Wikimedia content project.

We then stratify the population based on two dimensions.

First, the editors’s total edits over the past year, divided into six bins. This will allow us to learn more the relationship between editors' activity and their answers.

We chose these bins based on two main constraints:
* When combined with our project groups, they should produce sampling strata large enough to minimize re-identification risk. We don't plan to release the raw results, but we want to make it impossible even for Wikimedia Foundation staff to link a set of answers to a particular editor.
* There should be bin boundaries at 30 and 600 edits to preserve comparability with last year's data.
For the discussion leading up to our choices, see [task T188999](https://phabricator.wikimedia.org/T188999).

Second, the editors’s home wiki, which we define as the project where they have made the most edits during the past year. This will allow us to learn more about how answers differ across different project communities and to oversample certain smaller communities to ensure we have sufficient statistical power to make inferences about their results.

Since many projects have few editors, only 13 of the largest have the own groups. The rest of the Wikipedias are combined into 4 geographic groups, with all the remaining projects going into a single `other` group.

Therefore, our strategy is a [stratified random sample](https://en.wikipedia.org/wiki/Stratified_sampling) with 6 × 18 = 108 strata.

In all cases, edits counts are adjusted by treating each Wikidata edits as a 1/10 of a normal edit, in order to account for the greater granularity of Wikidata edits. This prevents counterintuitive choices of Wikidata as some editors' home wiki.

