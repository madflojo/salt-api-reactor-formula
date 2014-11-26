{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "PICKSOMETHINGBETTERPLZKTHX" %}
minion_key_accept:
  wheel.key.accept:
    - match: '{{ postdata.minion }}'
{% endif %}
  
