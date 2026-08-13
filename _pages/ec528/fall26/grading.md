---
title: ""
permalink: /ec528/fall26/grading/
author_profile: false  
classes: ec528-page
layout: single
---


# Grading

Project work accounts for **70%** of your final grade. The remaining 30% comes from paper quizzes, described in the [syllabus]({{ '/ec528/fall26/' | relative_url }}).

| Component | Weight | Graded as |
| --- | --- | --- |
| Project | 50% | Team |
| Presentation | 10% | Individual |
| Individual contribution | 10% | Individual |

## Grading Policy

### Project: 50%

Most of this component is a team score: every member receives the same mark. The one exception is the **final presentation**, which is graded per person. Individual differences are otherwise handled by the *Presentation* and *Individual contribution* components below.

| Component | Weight |
| --- | --- |
| Three project demos | 25% |
| Final project result and report | 20% |
| Presentation quizzes | 5% |

**Presentation quizzes** are short quizzes checking that you followed your classmates' demo presentations.

#### Project demos: 25%

The demo score is the team's technical score. Presentation delivery is *not* graded here — see *Presentation* below. The three demos are **not** weighted equally, and Demo 1 is graded on different criteria:

| Demo | Weight | Criteria |
| --- | --- | --- |
| Demo 1 | 7% | progress 50%, slides 25%, project description 15%, challenge 10% |
| Demo 2 | 9% | progress 50%, design doc including demo video 20%, code quality 10%, slides 10%, technical depth 10% |
| Demo 3 | 9% | same as Demo 2 |

Demo 1 asks you to propose an idea and show a preliminary implementation. Your **project description** is due in the repository at the Demo 1 deadline. **Challenge** measures how technically difficult the idea you proposed is — an ambitious proposal scores higher than a safe one.

#### Final project result and report: 20%

| Component | Weight | Graded as |
| --- | --- | --- |
| Final presentation | 30% | Individual |
| Artifact: reproducibility | 50% | Team |
| Artifact: documentation | 20% | Team |

Each team splits its members into two groups: the **live group** gives a 20-minute talk in class, and the **video group** records a 20-minute video presentation. Both run 20 minutes, but the video is held to a higher standard — see the [final presentation rubric](#final-presentation).

The final presentation score is **individual**: you are graded on the part you personally delivered. The *Presentation: 10%* component below covers the three milestone demos only.

### Presentation: 10%

Graded per presenter on presentation quality, clarity, and engagement. Every team member must present at least once during the three demos; teams larger than three should split each demo among multiple presenters so that everyone presents. Your score is the average over the demos you personally presented.

### Individual contribution: 10%

This component replaces the peer-evaluation multiplier used in previous semesters. It is split evenly:

* **5%: Peer evaluation.** Before the final project evaluation, each student anonymously assigns an *involvement score* to every teammate, reflecting that teammate's relative contribution to the team effort.
  * Scores range from 50% to 150%, with a minimum increment of 1%.
  * Your scores must average 100% across the teammates you rate. In a 5-person team you rate the other 4, so your scores must total 400%. For example, if you give A 80%, the remaining three must share 320% — e.g. 110% + 110% + 100%.
  * Your peer points = 5 × min(your average involvement score, 100%) / 100%. A student who carries their share receives the full 5 points; only under-contribution costs points.
* **5%: Mentor evaluation.** Your mentor rates each team member on engagement, technical contribution, and reliability.

## Rubrics

### Progress

**Progress** is evaluated against the milestones your own team committed to in its project description, not against other teams. Projects come from different mentors and differ in scope, so teams are not compared to one another on progress.

Progress must be **demonstrable**. We grade what runs and what is committed to your repository — not what a slide claims.

Progress is scored out of **10**, where 10 means you completed everything you committed to:

| Score | Level | What it looks like |
| --- | --- | --- |
| 10 | Complete | Every committed milestone met and demonstrated working. |
| 8–9 | Nearly complete | All major milestones met. A few minor items are outstanding and you identify them yourself. |
| 6–7 | Partial | Most milestones met. Gaps are identified honestly and come with a credible recovery plan. |
| 4–5 | Behind | Significant milestones missed, with no convincing plan to recover. |
| 1–3 | Little progress | Little or no demonstrable work since the previous demo. |

There is no score above 10, so finishing your plan early is already full marks for progress. Work that goes beyond the plan is rewarded through **challenge** (Demo 1) and **technical depth** (Demos 2 and 3) instead.

Revising your milestones is allowed and expected — real projects change direction. Announce the change and its justification at the demo, and you will be graded against the revised plan. Silently dropping a milestone and not mentioning it is treated as a miss.

### Slides

Each criterion is worth 20% of the slides score.

| Criterion | What we look for |
| --- | --- |
| Problem and motivation | The problem, why it matters, and what success would look like are stated up front. |
| Design | Architecture and the key design decisions are explained, with at least one clear diagram. |
| What changed | Work that is new since the previous demo (since the proposal, for Demo 1) is explicitly identified. |
| Evidence | Claims are backed by results: measured numbers, labeled axes, and a baseline to compare against. |
| Clarity | Legible text, no walls of text, self-contained figures, and you finish within the allotted time. |

### Final presentation

The video is held to a **higher standard** than the live talk, because unlike a live talk it can be re-recorded and edited:

| Requirement | What we expect from the video |
| --- | --- |
| Content density | Higher than the live talk. No dead air, no fumbling, no padding to reach 20 minutes. |
| Narration | Audible and well paced. Script it rather than improvising. |
| Animation | Use animation to explain your design and data flow, not static bullet slides. |
| The system running | Include screen recording of your system actually running — terminal output, dashboards, plots being produced. Slides alone are not enough. |

### Artifact: reproducibility

Graded the way a top-tier systems conference evaluates artifacts: **we will run your code.** We check whether the experimental claims made in your presentation and documentation actually reproduce.

| Score | What it looks like |
| --- | --- |
| 10 | Every experimental claim reproduces on our machines, within the tolerance you state. |
| 8–9 | The headline claims reproduce. Minor numbers differ, and your documentation already explains why. |
| 6–7 | The code builds and runs, but some claimed results do not reproduce and this is not explained. |
| 4–5 | The code builds and runs only on a toy input. The claimed experiments cannot be rerun. |
| 1–3 | We cannot build or run the code from your repository. |

A claim you do not make cannot cost you points here. Stating an honest, narrower result that reproduces scores better than an impressive result we cannot reproduce.

### Artifact: documentation

The same standard an artifact evaluation committee applies. Each criterion is worth 25%:

| Criterion | What we look for |
| --- | --- |
| Setup | Exact dependencies, versions, and hardware assumptions. Someone starting from a clean machine can follow it. |
| How to run | A documented command or script for each experiment, with the expected runtime. |
| Expected results | Each experiment states what output to expect and which claim, figure, or table it supports. |
| Claims and limitations | Which claims your artifact supports, plus an honest account of what does not work or was not tested. |
