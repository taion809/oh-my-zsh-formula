include: 
    - oh-my-zsh.zsh

change_shell:
    module.run:
        - name: user.chshell
        - m_name: {{ pillar['oh-my-zsh']['user']['name'] }}
        - shell: /usr/bin/zsh

https://github.com/robbyrussell/oh-my-zsh.git:
    git.latest:
        - rev: master
        - target: "{{ pillar['oh-my-zsh']['user']['home'] }}/.oh-my-zsh"
        - unless: "test -d {{ pillar['oh-my-zsh']['user']['home'] }}/.oh-my-zsh"

.zshrc:
    file.managed:
        - name: "{{ pillar['oh-my-zsh']['user']['home'] }}/.zshrc"
        - source: salt://oh-my-zsh/files/.zshrc
        - user: {{ pillar['oh-my-zsh']['user']['name'] }}
        - group: {{ pillar['oh-my-zsh']['user']['group'] }}
        - mode: '0644'
        - template: jinja
