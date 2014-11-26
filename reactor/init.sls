{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "PICKSOMETHINGBETTERPLZKTHX" %}
generic_init:
  cmd.{{ postdata.module }}:
    - tgt: '{{ postdata.tgt }}'
    {% if "matcher" in postdata %}
    - expr_form: {{ postdata.matcher }}
    {% endif %}
    - arg:
      - {{ postdata.args }}
{% endif %}
  
