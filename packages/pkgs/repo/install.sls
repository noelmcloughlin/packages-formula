# -*- coding: utf-8 -*-
# vim: ft=sls

    {%- if grains.os_family == 'Arch' %}

packages-pkgs-repo-install-custom-pacman-repo:
  file.append:
    - name: /etc/pacman.d/yaourt
    - makedirs: True
    - text: |
        [archlinuxfr]
        SigLevel = Never
        Server = http://repo.archlinux.fr/$arch
  cmd.run:
    - name: /usr/bin/pacman -Syy --noconfirm
    - onlyif: test -x /usr/bin/pacman
    - onchanges:
      - file: packages-pkgs-repo-install-custom-pacman-repo
    - require:
      - file: packages-pkgs-repo-install-custom-pacman-repo

    {%- endif %}
