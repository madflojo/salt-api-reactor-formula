{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "PICKSOMETHINGBETTERPLZKTHX" %}
minion_key_{{ postdata.function }}:
  wheel.key.{{ postdata.function }}:
    - match: '{{ postdata.minion }}'
{% endif %}
  
