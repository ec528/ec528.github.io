---
title: ""
permalink: /ec528/fall26/setup/
author_profile: false  
classes: ec528-page
layout: single
---


# Project Setup and Submission

## Setup

Each team has **one GitHub repository** for the whole semester, and it is the single source of truth for the project. It lives in the course GitHub organization, [`ec528-fall26`](https://github.com/ec528-fall26), and **we have already created it for you** from the course template. You do not need to create a repository or share it with anyone.

To be given push access, send us your GitHub username using the form linked from the pinned Piazza post, by **Friday 09/11**. The repositories are public, so you can read yours before then, but you cannot push to it until we have added you.

What you need to do:

1. **Have a GitHub account**, and submit your username with the form linked from the pinned Piazza post so we can add you to the organization.
2. **Clone your repository and push a trivial commit in the first week.** Do not discover on the morning of Demo 1 that you never had push access.
3. Your mentor is added to the repository along with the team.

Your repository starts with this layout. Keep it — the artifact documentation score rewards a repository someone else can pick up and run:

```
README.md          # what the project is, and how to run it
docs/              # design proposal, design document
slides/            # demo slides
src/               # source code
experiments/       # scripts that reproduce your results
```

## Set up AWS credits

Amazon has given the course **AWS promotional credits**, and each team gets a
share. The amount differs by team, because the projects need very different
amounts of compute. Your codes are emailed to your team directly. **They are
never posted here or on Piazza**: anyone who has the string can redeem it, so
treat them like cash.

### Setup instructions

1. **Split your team's codes among teammates.** AWS accepts **only one code from
   this batch per account**: the first code redeems and the rest are rejected. So
   every code goes into a different account. A code that was rejected is still
   valid, as long as nobody has redeemed it elsewhere.
2. **Each teammate who takes a code creates their own AWS account** and **adds a
   valid credit card** to it. AWS will not accept a promotional code on an account
   with no payment method, so this is the step that usually blocks people.
3. **Redeem that one code** at the
   [AWS promotional credit page](https://aws.amazon.com/awscredits/) or in the
   Billing and Cost Management console under *Credits*, before you run anything
   in the account: AWS will not retroactively cover charges from before you
   redeemed. If your team has more codes than people, keep the extra codes and
   redeem each one later in a new account (it needs its own email address; the
   same card can be reused).
4. **Set a [billing alarm](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html)
   the same day** on every account, with thresholds well below that account's
   $100.

### Recommendations

* **Run the project in one account at a time, and move when its credit runs
  low.** Credit cannot be moved between accounts, so the workload moves instead.
  Start in one teammate's account; when its balance is nearly used up (see
  *Credits* in the Billing console), move to the next teammate's account.
* **Make moving cheap from day one.** Create your AWS resources with scripts kept
  in your repository (for example Terraform, CloudFormation, or AWS CLI scripts)
  rather than by clicking in the console, so that moving means re-running a
  script. Data you need to keep can come with you: copy S3 objects to the new
  account, or share AMIs and EBS snapshots with it.
* **Clean up the old account completely after moving.** Terminate instances and
  delete EBS volumes, snapshots, S3 buckets, and Elastic IP addresses. Anything
  left behind is billed to that teammate's card once the credit is gone.
* **Whoever owns the active account gives everyone else an IAM user.** Do not
  share the root login, and enable MFA on the root account.
* **Stop instances you are not using.** Note that EBS volumes keep billing even
  while the instance attached to them is stopped.
* **Keep credentials out of the repository**, in environment variables or a
  local `~/.aws/credentials` file, and add anything credential-shaped to
  `.gitignore`. Prefer IAM roles over long-lived access keys.

### Notices

**Never commit AWS keys.** Your repository is public. Automated scanners find
leaked access keys within minutes of a push and use them to mine cryptocurrency
at your expense — this is one of the most common ways student projects run up
four-figure bills. If you do leak a key, deactivate it in the IAM console
immediately and tell the course staff. Deleting the commit does not help: the
key is already in your history and already scraped.

**Overruns are yours.** When an account's credit runs out, AWS charges the card
on that account and does not refund overruns, and neither the course nor Amazon
will cover them.
An instance someone forgets to stop over a weekend is enough to do it.

**Some services cannot be paid for with promotional credit**, and you will be
billed for them normally: AWS Marketplace purchases, upfront fees for Reserved
Instances and Savings Plans, Enterprise Support plans, Mechanical Turk, and
cryptocurrency mining.

**The credits expire on 28 February 2027.**

**If your team runs short**, say so before Demo 2 rather than after you have
already overrun. We are asking Amazon for more, and priority goes to teams that
can show what they spent the first allocation on.

## Submission

You do not have to do anything special to submit your project. There is no upload form and nothing to email. We use a snapshot of your GitHub repository as it exists at the deadline, and grade that version. You can still make changes to your repository after the deadline, but we will only use the snapshot of your code as of the deadline.

Every deliverable is due at **12:00 noon on the day of the corresponding class**, not at the start of class. The teaching staff needs that time to pull your work and review it before you present. Be sure to commit your changes and do a `git push` to GitHub, especially in the last few minutes.

### Submission branches

The one thing you do need to get right is the **branch**. The snapshot is taken from a branch named for the deliverable, so your work must be there by the deadline:

| Deliverable | Date | Deadline | Branch |
| --- | --- | --- | --- |
| Demo 1 | 09/23 | 12:00 noon | `demo-1` |
| Demo 2 | 10/21 | 12:00 noon | `demo-2` |
| Demo 3 | 11/16 | 12:00 noon | `demo-3` |
| Final presentation | 12/09 | 12:00 noon | `final-demo` |

You can create the branch with:

```bash
git checkout -b demo-1
```

You can use other branches (for example `main` or a feature branch) during development, but be sure to sync those changes into the submission branch before the deadline:

```bash
git checkout demo-1
git merge <branch_name>
git push origin demo-1
```

**Double check that your submission resides in the correct branch by the deadline.** Note that the separator is a dash `-`, not an underscore. Using a different branch name will result in failure to collect and grade your submission in time.

### What the branch must contain

By the deadline, the submission branch must contain your **slides** and **all of your code**. Depending on the deliverable, it must also contain:

| Deliverable | Also required in the branch |
| --- | --- |
| Demo 1 | Design proposal |
| Demo 2 | Design document, demo video |
| Demo 3 | Design document, demo video |
| Final presentation | Artifact documentation, recorded video presentation |

Every team member is responsible for making sure their own work is pushed and merged into the submission branch. Your commit history is also one of the inputs to the *Individual contribution* score, so commit as you work rather than having one person push everything at the end.

### Presentation quiz questions

Demo days have a **second deadline**. By **5:30 pm on the day of the demo**, each team must email the instructor two multiple-choice questions about its own presentation, with the correct answers marked. These are used for the quiz the class takes after all teams have presented.

This one goes by email, not through GitHub, and it goes to the instructor **only** — do not share your questions or answers with anyone outside your team before the quiz. A team that submits late, or not at all, receives zero on the presentation quiz for that session. See the [grading policy]({{ '/ec528/fall26/grading/#presentation-quizzes' | relative_url }}) for details.

## No Late Submissions

There are **no late hours, no late days, and no late tokens.**

We take the snapshot at 12:00 noon and grade exactly what is in the submission branch at that moment. A commit pushed at 12:01 is not collected, and work sitting on an unmerged branch is not collected either. A deliverable that is not in the correct branch at the deadline receives no credit for that deadline.

All four deadlines are known from the first week of the semester. Plan around them. If something outside your control is going to stop your team from meeting a deadline, contact the instructor **before** the deadline, not after.
