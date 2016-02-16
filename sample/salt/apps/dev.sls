app-directory::
  file.directory:
    - name: {{ pillar['app']['root_dir'] }}
    - user: {{ pillar['user'] }}
    - group: {{ pillar['user'] }}
    - dir_mode: 755
