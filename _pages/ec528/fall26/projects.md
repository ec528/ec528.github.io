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
| 09/23 | **Demo 1** — design proposal |
| 10/21 | **Demo 2** — working prototype |
| 11/16 | **Demo 3** — optimized system |
| 12/09 | **Final presentation** |

**How matching works.** You do not pick your own team. The project list is posted before the first lecture, and the mentors are introduced in class on 09/02. Read through every project, then fill in the **project preference form**, ranking the projects in the order you would like to work on them. The form is due **09/06** and it is how you get placed — if you do not submit it, you are assigned to whichever project still has room. Teams are announced on 09/09, and you meet your mentor in class that evening.

*Project preference form: link TBA*

## Project List

Each project is proposed and mentored by an engineer or researcher from industry
or a national lab. Read the full proposal before ranking your preferences — each
one lists the technical background it expects.

* [Build-Bench Challenge: Autonomous LLM Agents for Cross-Architecture Package Repair](../../projects/EC528-fall26-build-bench.pdf) ([Markdown](/_pages/projects/EC528-fall26-build-bench.md)) \
  *Mentor: Minghua Ma, Microsoft.* \
  Build an autonomous LLM agent that repairs software packages whose builds fail when migrated across x86_64, ARM, and RISC-V. The team submits a qualified agent to the ICSE 2027 Build-Bench Challenge. \
  Expects: Python, Linux/Git/Docker, and at least one member with LLM agent frameworks and one with build systems (CMake, Make, Autotools, Debian, RPM).

* [Load Modeling and Load Balancing Simulation Platform](../../projects/EC528-fall26-load-balancing.pdf) \
  *Mentor: Shripad Nadgowda, Meta.* \
  Build a platform that models steady-state request routing across a large fleet and answers "what-if" questions — what happens to utilization if request load grows, or if the balancing policy changes from round-robin to least-connection. \
  Expects: Python, C, or Go, and at least one member comfortable with containers/microservices, KV stores such as Redis, and SQL databases such as Postgres.

* [Zero Trust Cryptographic Confinement for AI Agents](../../projects/EC528-fall26-zero-trust.pdf) \
  *Mentor: Charles Munson, MIT Lincoln Laboratory.* \
  Build an end-to-end pipeline where an AI agent's request to execute a workload is paused, cryptographically approved by a multi-signature quorum, and only then deployed onto a remotely attested VM on the Mass Open Cloud. \
  Expects: at least one member with Python, Go, or Rust and one with a basic understanding of PKI and digital signatures. Experience with VMs, the MOC, or Keylime is valuable.

* [Computational Storage](../../projects/EC528-fall26-computational-storage.pdf) \
  *Mentors: Alex Merenstein, Vasily Tarasov, and Anthony Hsu, IBM.* \
  Layer a compute tier on top of an existing storage system so data is processed where it lives, rather than copied out and back. The team builds a serverless-style interface for arbitrary file operations plus a background format-conversion service, and measures both against a copy-process-copy-back baseline. \
  Expects: Linux command line for everyone, and at least one member with Python. Familiarity with containers or serverless is valuable; you will work with Kubernetes, Ceph, and Parquet.

## Important Documentation

| Document | Purpose |
| --- | --- |
| [Grading]({{ '/ec528/fall26/grading/' | relative_url }}) | Grading policy and the rubrics used for every deliverable |
| [Project Setup and Submission]({{ '/ec528/fall26/setup/' | relative_url }}) | Repository setup, submission branches, and deadlines |

## Groups

Projects are done in teams of **4-6 students**. You do not pick your own team: you submit a ranked list of project preferences by **09/06**, and teams are assigned based on those preferences and announced on **09/09**.

Every team member is expected to contribute technically. Two parts of your grade are individual rather than team-wide — the *Presentation* component and the *Individual contribution* component — so a team cannot carry a member who does not participate, and a strong contributor is not dragged down by a weak team.

## Getting Started

Once teams are announced on 09/09:

1. **Meet your mentor.** Agree on a regular meeting time. Mentors are volunteers with day jobs, so schedule early and be reliable.
2. **Clone your team repository.** We create it for you in the course GitHub organization, from the course template. Push a trivial commit in the first week to confirm you have access.
3. **Scope the work and write your design proposal.** Decide what you are actually going to build and what milestones you commit to for each demo. This document is due in the repository at Demo 1 and is what your *progress* is graded against for the rest of the semester.
4. **Start building as soon as the design is settled.** Demo 1 is a proposal, but Demo 2 four weeks later expects a prototype that runs end to end.

## Version Control

All teams use **git**, hosted on GitHub. Each team has one repository, and it is the single source of truth for the project.

Commit as you work rather than in a single dump before each deadline. Your commit history is the evidence that the team worked steadily, and it is one of the inputs to the *Individual contribution* score.

## Grading

Project work accounts for **70%** of your final grade: 50% for the team project, 10% for your individual presentation, and 10% for your individual contribution to the team. Progress is graded against the milestones your own team commits to, not against other teams. The final artifact is graded the way a top-tier conference evaluates artifacts — we will run your code and check that your claimed results reproduce. So turn in something that runs, and do not claim a result we cannot reproduce. The [grading policy page]({{ '/ec528/fall26/grading/' | relative_url }}) lists detailed information about how grading is done.

## Submission

Everything your team produces for this course lives in your team's **GitHub repository**: the design proposal, demo slides, design documents, demo videos, source code, and the final report. There is no separate submission system.

Each deliverable is due at **12:00 noon on the day of the corresponding class**, in a branch named for that deliverable (`demo-1`, `demo-2`, `demo-3`, `final-demo`). We take an automatic snapshot of that branch at the deadline and grade exactly what is in it. See [Project Setup and Submission]({{ '/ec528/fall26/setup/' | relative_url }}) for the full mechanics.

## Late Policies

There are **no late hours, no late days, and no late tokens.** A deliverable that is not in the correct branch at 12:00 noon on the deadline receives no credit for that deadline.

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
