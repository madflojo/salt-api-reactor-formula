{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "PICKSOMETHINGBETTERPLZKTHX" %}
state_highstate:
  cmd.state.highstate:
    - tgt: '{{ postdata.tgt }}'
    {% if "matcher" in postdata %}
    - expr_form: {{ postdata.matcher }}
    {% endif %}
    {% if "args" in postdata %}
    - arg:
      - {{ postdata.args }}
    {% endif %}
{% endif %}
  
