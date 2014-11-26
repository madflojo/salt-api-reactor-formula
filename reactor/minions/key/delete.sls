{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "PICKSOMETHINGBETTERPLZKTHX" %}
minion_key_delete:
  wheel.key.delete:
    - match: '{{ postdata.minion }}'
{% endif %}
  
