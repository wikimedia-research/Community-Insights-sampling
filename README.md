This repository contains the code used to draw a sample of Wikimedia project contributors for the Wikimedia Foundation's annual [Community Insights survey](https://meta.wikimedia.org/wiki/Community_Insights).

We want to learn about **recent, recurring active editors** on Wikimedia projects. Therefore, we define our population as users who were [active editors](https://meta.wikimedia.org/wiki/Research:Active_editor) in at least 2 of the past 3 months: registered, non-bot editors with at least 5 content edits across all Wikimedia content project.

Since the survey is distributed by email, we further limit the population to users who have confirmed email addresses attached to their accounts and who have not turned off the "allow other users to email me" preferenced.

We also exclude users who've contacted us to opt out of future surveys and users whose email is already represented by another editor in the popluation, although both of these exclusions affect only a tiny number of users.

We then stratify the population based on two dimensions.

First, the editors’s total edits over the past year, divided into five bins. This allows us to learn more the relationship between editors' activity and their answers.

We chose these bins based on two main constraints:
* When combined with our project groups, they should produce sampling strata large enough to avoid re-identification risk. We don't plan to release the raw results, but we want to make it difficult even for Wikimedia Foundation staff to link a set of answers to a particular editor (after the email addresses linked to responses are deleted after the end of data collection)
* There should be bin boundaries at 30 and 600 edits to preserve comparability with previous data.
For the discussion leading up to our choices, see [task T188999](https://phabricator.wikimedia.org/T188999).

Second, the editors’s home wiki, which we define as the project where they have made the most edits during the past year. This will allow us to learn more about how answers differ across different project communities and to [oversample](https://en.wikipedia.org/wiki/Oversampling_and_undersampling_in_data_analysis) certain smaller communities to ensure we have sufficient statistical power to make inferences about their results.

Since many projects have few editors, only 16 of the largest have the own groups. Most of the remaining Wikipedias are combined into 6 regional groups and all the remaining projects go into a single `other` group.

Therefore, our strategy is a [stratified random sample](https://en.wikipedia.org/wiki/Stratified_sampling) with 5 × 23 = 115 strata.

In all cases, edits counts are adjusted by treating each Wikidata edits as a 1/10 of a normal edit, in order to account for the greater granularity of Wikidata edits. This prevents counterintuitive choices of Wikidata as some editors' home wiki.
