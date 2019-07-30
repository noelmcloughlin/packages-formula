# -*- coding: utf-8 -*-
# vim: ft=sls

    {%- if grains.os_family == 'Arch' %}

packages-pkgs-repo-clean-custom-pacman-repo:
  file.absent:
    - name: /etc/pacman.d/yaourt

    {%- endif %}
