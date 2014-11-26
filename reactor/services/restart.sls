{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "PICKSOMETHINGBETTERPLZKTHX" %}
services_restart:
  cmd.service.restart:
    - tgt: '{{ postdata.tgt }}'
    {% if "matcher" in postdata %}
    - expr_form: {{ postdata.matcher }}
    {% endif %}
    - arg:
      - {{ postdata.args }}
{% endif %}
  
