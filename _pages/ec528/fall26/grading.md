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
| [Demo 1](#demo-1) | 5% |
| [Demo 2](#demo-2) | 10% |
| [Demo 3](#demo-3) | 10% |
| [Final project result and report](#final-project-result-and-report--20) | 20% |
| [Presentation quizzes](#presentation-quizzes) | 5% |

Every component is broken down in [Rubrics](#rubrics) below.

### Presentation: 10%

At every milestone demo, each team gets **10 minutes to present and 5 minutes for questions**:

| Session | Presentation | Q&A |
| --- | --- | --- |
| Demo 1, Demo 2, Demo 3 | 10 minutes | 5 minutes |
| Final presentation | 20 minutes | — |

Keep to the 10 minutes. Running over is cut off, and the [slides rubric](#slides) counts finishing on time. Be ready to answer questions about your own design during Q&A — fielding them is part of what is graded here.

Graded per presenter on presentation quality, clarity, and engagement. **At most two team members may present in a single demo**, and every team member must present at least once across the three demos — three demos with two presenters each covers a team of up to six. Your score is the average over the demos you personally presented.

This component covers the three milestone demos only. The final presentation is graded separately, inside the final project score.

### Individual contribution: 10%

This component replaces the peer-evaluation multiplier used in previous semesters. It is split evenly:

* **5%: Peer evaluation.** Before the final project evaluation, each student anonymously rates **every teammate on a scale of 1 to 10**, where 10 means that teammate fully carried their share of the work and 1 means they contributed essentially nothing.
  * Your peer score is the **average of the scores your teammates give you**.
  * Your peer points = 5 × min(your average, 9) ÷ 9. An average of **9 or above earns the full 5 points**, so pulling your weight is enough — only genuine under-contribution costs points.
  * Ratings are anonymous. Your teammates never see who gave which score.
* **5%: Mentor evaluation.** Your mentor rates each team member on engagement, technical contribution, and reliability.

## Rubrics

### Demo 1

Demo 1 is a **design proposal**. You are not expected to have a working system yet — you are expected to have decided what you are going to build, why it is worth building, and how you will know whether it worked.

| Criterion | Weight | What we look for |
| --- | --- | --- |
| Design proposal | 50% | A clear problem statement, the design you propose, and **verifiable milestones for Demo 2, Demo 3, and the final**. This document is what your progress is graded against for the rest of the semester, so vague milestones hurt you later. |
| Slides | 25% | See the [slides rubric](#slides). |
| Challenge | 25% | How technically difficult the design you proposed is. An ambitious proposal scores higher than a safe one. |

Your design proposal is due in the repository at the Demo 1 deadline.

### Demo 2

Demo 2 requires a **working prototype**. It has to run end to end and do the thing you proposed. It does **not** have to be fast — performance is not graded at this demo.

| Criterion | Weight | What we look for |
| --- | --- | --- |
| Progress | 50% | A prototype that runs end to end, meeting the milestones you committed to for this demo. See the [progress rubric](#progress). |
| Design document | 20% | How to reproduce the results you claim: setup, the command to run each experiment, and what output to expect. **The TA will run it.** |
| Code quality | 10% | Code someone else on the team can read, build, and extend. Structured, not a pile of one-off scripts. |
| Slides | 10% | See the [slides rubric](#slides). |
| Technical depth | 10% | Real systems work rather than plumbing. Wiring together existing services scores lower than solving a hard problem inside one. |

### Demo 3

Demo 3 is about **making the prototype good**. By this point the system works, so the question is how well: performance, scalability, and robustness against the baseline you established at Demo 2.

| Criterion | Weight | What we look for |
| --- | --- | --- |
| Progress | 50% | Measured improvement over your Demo 2 baseline, meeting the milestones you committed to for this demo. See the [progress rubric](#progress). |
| Design document | 20% | Updated to cover your optimization experiments: how to run each one and what output to expect. **The TA will run it.** |
| Code quality | 10% | Code someone else on the team can read, build, and extend. Structured, not a pile of one-off scripts. |
| Slides | 10% | See the [slides rubric](#slides). |
| Technical depth | 10% | Real systems work rather than plumbing. Wiring together existing services scores lower than solving a hard problem inside one. |

### Final project result and report — 20%

| Component | Weight | Graded as |
| --- | --- | --- |
| [Final presentation](#final-presentation--30) | 30% | Individual |
| [Artifact: reproducibility](#artifact-reproducibility--50) | 50% | Team |
| [Artifact: documentation](#artifact-documentation--20) | 20% | Team |

#### Final presentation — 30%

Each team splits its members into two groups: the **live group** gives a 20-minute talk in class, and the **video group** records a 20-minute video presentation. This score is **individual** — you are graded on the part you personally delivered.

The video is held to a **higher standard** than the live talk, because unlike a live talk it can be re-recorded and edited:

| Requirement | What we expect from the video |
| --- | --- |
| Content density | Higher than the live talk. No dead air, no fumbling, no padding to reach 20 minutes. |
| Narration | Audible and well paced. Script it rather than improvising. |
| Animation | Use animation to explain your design and data flow, not static bullet slides. |
| The system running | Include screen recording of your system actually running — terminal output, dashboards, plots being produced. Slides alone are not enough. |

#### Artifact: reproducibility — 50%

Graded the way a top-tier systems conference evaluates artifacts: **we will run your code.** We check whether the experimental claims made in your presentation and documentation actually reproduce.

| Score | What it looks like |
| --- | --- |
| 10 | Every experimental claim reproduces on our machines, within the tolerance you state. |
| 8–9 | The headline claims reproduce. Minor numbers differ, and your documentation already explains why. |
| 6–7 | The code builds and runs, but some claimed results do not reproduce and this is not explained. |
| 4–5 | The code builds and runs only on a toy input. The claimed experiments cannot be rerun. |
| 1–3 | We cannot build or run the code from your repository. |

A claim you do not make cannot cost you points here. Stating an honest, narrower result that reproduces scores better than an impressive result we cannot reproduce.

#### Artifact: documentation — 20%

The same standard an artifact evaluation committee applies. Each criterion is worth 25%:

| Criterion | What we look for |
| --- | --- |
| Setup | Exact dependencies, versions, and hardware assumptions. Someone starting from a clean machine can follow it. |
| How to run | A documented command or script for each experiment, with the expected runtime. |
| Expected results | Each experiment states what output to expect and which claim, figure, or table it supports. |
| Claims and limitations | Which claims your artifact supports, plus an honest account of what does not work or was not tested. |

### Presentation quizzes

After every demo session, once all teams have presented, the class answers a short quiz made up of questions written by the presenting teams. It checks that you followed your classmates' work rather than only your own.

**Writing the questions is mandatory.** Each team must email the instructor **two multiple-choice questions** about its own presentation by **5:30 pm on the day of the demo**, one hour before class starts.

| Rule | Detail |
| --- | --- |
| What to submit | Exactly two questions about your own presentation, **each with the correct answer marked**. |
| Format | **Multiple choice only.** Short-answer and open-ended questions are not accepted. |
| How | Email to the instructor. |
| Confidentiality | Send the questions and answers to the instructor **only**. Do not share them with anyone outside your team before the quiz. |
| When | **5:30 pm** on the day of the demo. |
| If you are late | The **whole team** receives **zero** on the presentation quiz for that session. |

Note that a demo day has two different deadlines: your demo materials are due at **12:00 noon** in the submission branch, and your two quiz questions are due by email at **5:30 pm**.

### Progress

**Progress** is evaluated against the milestones your own team committed to in its design proposal, not against other teams. Projects come from different mentors and differ in scope, so teams are not compared to one another on progress.

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
