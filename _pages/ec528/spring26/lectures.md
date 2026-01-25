---
title: ""
permalink: /ec528/spring26/lectures
author_profile: false  
classes: ec528-page
layout: single

semester:
  start_date: 2026-01-21  
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

{% assign lectures = site.data.spring26_lecture %}

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
      <td></td>
      <td>{% if lec.note %}{{ lec.note }}{% endif %}</td>
    {% else %}
      <td>{{ lec.title }}</td>
      <td>
        {% if lec.slides %}
          <a href="{{ lec.slides }}">Slides</a>
        {% endif %}
      </td>
      <td>
        {% if lec.readings %}
          {% for r in lec.readings %}
            <a href="{{ r.link }}">{{ r.name }}</a>{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        {% endif %}
      </td>
      <td>{% if lec.note %}{{ lec.note }}{% endif %}</td>
      {% assign lec_count = lec_count | plus: 1 %}
    {% endif %}
  </tr>

  {% assign dow = current | date: "%a" %}
  {% if dow == "Mon" %}
    {% assign current = current | plus: 172800 %}
  {% else %}
    {% assign current = current | plus: 432000 %}
  {% endif %}
{% endfor %}

  </tbody>
</table>