---
title: ""
permalink: /ec528/fall26/lectures
author_profile: false  
classes: ec528-page
layout: single

semester:
  start_date: 2026-09-02  
  meeting_days: ["Mon", "Wed"]
---

# Lectures

<table class="schedule-table">
  <thead>
    <tr>
      <th>Week</th>
      <th>Date</th>
      <th>Lecture Title</th>
      <th>Slides</th>
      <th>Readings</th>
      <th>Note</th>
    </tr>
  </thead>
  <tbody>

{% assign lectures = site.data.fall26_lecture %}

{% assign start = page.semester.start_date | date: "%s" | plus: 43200 %}
{% assign current = start %}
{% assign start_dow = start | date: "%a" %}
{% case start_dow %}
  {% when "Mon" %}{% assign start_monday = start %}
  {% when "Tue" %}{% assign start_monday = start | minus: 86400 %}
  {% when "Wed" %}{% assign start_monday = start | minus: 172800 %}
  {% when "Thu" %}{% assign start_monday = start | minus: 259200 %}
  {% when "Fri" %}{% assign start_monday = start | minus: 345600 %}
  {% when "Sat" %}{% assign start_monday = start | minus: 432000 %}
  {% when "Sun" %}{% assign start_monday = start | minus: 518400 %}
{% endcase %}
{% assign one_day = 86400 %}
{% assign lec_count = 0 %}

{% for lec in lectures %}
  {% comment %} A lecture may override the auto-generated date (e.g. substitute Monday schedule). {% endcomment %}
  {% if lec.date %}
    {% assign current = lec.date | date: "%s" | plus: 43200 %}
  {% endif %}
  {% assign lec_date = current | date: "%m/%d %a" %}
  {% assign diff_secs = current | minus: start_monday %}
  {% assign week = diff_secs | divided_by: 604800 | plus: 1 %}

  <tr>
    <td>Week {{ week }}</td>
    <td>{{ lec_date }}</td>

    {% if lec.no_class or lec.canceled %}
      <td><strong>No Class</strong></td>
      <td></td>
      <td></td>
      <td>{% if lec.note %}{{ lec.note }}{% endif %}</td>
    {% else %}
      <td>{{ lec.title }}</td>
      <td>
        {% comment %} Liquid treats "" as truthy, so check for blank explicitly. {% endcomment %}
        {% if lec.slides != nil and lec.slides != "" %}
          <a href="{{ lec.slides }}">Slides</a>
        {% endif %}
      </td>
      <td>
        {% if lec.readings %}
          {% for r in lec.readings %}
            {% if r.link != nil and r.link != "" %}
              <a href="{{ r.link }}">{{ r.name }}</a>
            {% else %}
              {{ r.name }}
            {% endif %}{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        {% endif %}
      </td>
      <td>{% if lec.quiz %}<span class="quiz-tag">Quiz</span>{% if lec.note %}<br>{% endif %}{% endif %}{% if lec.note %}<span{% if lec.note_alert %} class="note-alert"{% endif %}>{{ lec.note }}</span>{% endif %}</td>
      {% assign lec_count = lec_count | plus: 1 %}
    {% endif %}
  </tr>

  {% comment %} Advance to the next meeting: Mon -> Wed (+2d), Wed -> Mon (+5d).
     Tue only occurs on a substitute Monday, whose next meeting is the Wed after (+1d). {% endcomment %}
  {% assign dow = current | date: "%a" %}
  {% case dow %}
    {% when "Mon" %}{% assign current = current | plus: 172800 %}
    {% when "Tue" %}{% assign current = current | plus: 86400 %}
    {% else %}{% assign current = current | plus: 432000 %}
  {% endcase %}
{% endfor %}

  </tbody>
</table>