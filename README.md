This repository contains the code used to distribute the Wikimedia Foundation's [Community Engagement Insights annual survey](https://meta.wikimedia.org/wiki/Community_Engagement_Insights/Annual_surveys) to a sample of Wikimedia project contributors.

## Sampling strategy for the 2017-18 survey
*In all cases, edits counts are adjusted by treating each Wikidata edits as a 1/10 of a normal edit.*

We want to survey **recent, recurring active editors** on Wikimedia projects. Therefore, we define our population as users who were [active editors](https://meta.wikimedia.org/wiki/Research:Active_editor) in at least 2 of the past 3 months: registered, non-bot editors with at least 5 content edits across all Wikimedia content project.

We then stratify the population based on two dimensions. First, the user’s total edits over the past year, divided into six buckets. Second, the user’s home wiki, which we define as the project where the have made the most edits during the past year.

Therefore, our strategy is a [stratified random sample](https://en.wikipedia.org/wiki/Stratified_sampling) with 6 × 19 = 114 strata.
