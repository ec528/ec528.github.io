---
title: ""
permalink: /ec528/fall26/projects/
author_profile: false  
classes: ec528-page
layout: single
---


# Projects

## Overview

The course project is a semester-long, team-based systems project, and it is the largest single component of your grade. Each team works on a realistic cloud or distributed systems problem proposed and supervised by a **mentor** — typically an industry engineer, a researcher, or a senior graduate student. Projects usually run on real infrastructure, such as a commercial public cloud or a research cloud.

Unlike a problem set, a project has no predetermined answer. You will scope the problem yourself, decide what to build, and then be held to the plan you set. The emphasis is on building something that runs, measuring it honestly, and being able to convince someone else that your results are real.

The project runs on the following schedule:

| Date | Milestone |
| --- | --- |
| 09/02 | Project list released; mentors introduced in class |
| 09/06 | **Project preferences due** |
| 09/09 | Teams announced; meet your mentor |
| 09/30 | **Demo 1** — proposal and preliminary implementation; project description due |
| 10/21 | **Demo 2** |
| 11/16 | **Demo 3** |
| 12/09 | **Final presentation** |

## Project List

TBD

## Important Documentation

| Document | Purpose |
| --- | --- |
| [Grading]({{ '/ec528/fall26/grading/' | relative_url }}) | Grading policy and the rubrics used for every deliverable |
| Setup | TBA |

## Groups

Projects are done in teams of **4-6 students**. You do not pick your own team: you submit a ranked list of project preferences by **09/06**, and teams are assigned based on those preferences and announced on **09/09**.

Every team member is expected to contribute technically. Two parts of your grade are individual rather than team-wide — the *Presentation* component and the *Individual contribution* component — so a team cannot carry a member who does not participate, and a strong contributor is not dragged down by a weak team.

## Getting Started

Once teams are announced on 09/09:

1. **Meet your mentor.** Agree on a regular meeting time. Mentors are volunteers with day jobs, so schedule early and be reliable.
2. **Create your team repository** on GitHub and give the instructor, TA, and your mentor access.
3. **Scope the work and write your project description.** Decide what you are actually going to build and what milestones you commit to for each demo. This document is due in the repository at Demo 1 and is what your *progress* is graded against for the rest of the semester.
4. **Get something running early.** Demo 1 expects a preliminary implementation, not just a plan.

## Version Control

All teams use **git**, hosted on GitHub. Each team has one repository, and it is the single source of truth for the project.

Commit as you work rather than in a single dump before each deadline. Your commit history is the evidence that the team worked steadily, and it is one of the inputs to the *Individual contribution* score.

## Grading

Project work accounts for **70%** of your final grade: 50% for the team project, 10% for your individual presentation, and 10% for your individual contribution to the team. Progress is graded against the milestones your own team commits to, not against other teams. The final artifact is graded the way a top-tier conference evaluates artifacts — we will run your code and check that your claimed results reproduce. So turn in something that runs, and do not claim a result we cannot reproduce. The [grading policy page]({{ '/ec528/fall26/grading/' | relative_url }}) lists detailed information about how grading is done.

## Submission

Everything your team produces for this course lives in your team's **GitHub repository**: the project description, demo slides, design documents, demo videos, source code, and the final report. There is no separate submission system.

For every deadline we grade **the version in the repository at the deadline**. Work sent by email, or shown only on a laptop during a demo, does not count.

## Late Policies

Late submissions are not accepted, and there are no late tokens. A deliverable that is not in the repository at the deadline receives no credit for that deadline.

Deadlines are known from the first week of the semester, so plan around them. If something outside your control is going to prevent your team from meeting a deadline, contact the instructor **before** the deadline, not after.

## Cheating and Collaboration

You are expected to build your project yourselves. The following are **not permitted**:

* submitting code, text, or results your team did not produce and presenting them as your own,
* copying another team's work,
* fabricating or selectively reporting experimental results, and
* publicly posting your project in a way that lets a future team submit it as their own.

The following **are** permitted and encouraged:

* using existing open-source systems, libraries, and frameworks as components of your project, provided you say clearly which parts are yours and which are not,
* discussing designs, approaches, and debugging with other teams, and
* asking your mentor, the TA, or the instructor for help at any point.

Because the reproducibility component is graded by running your code, **overstating a result is worse than reporting a modest one**. An honest negative result costs you very little. A claim we cannot reproduce costs you a great deal.
