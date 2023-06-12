# tmux
tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal.

터미널 화면을 유연하게 사용할 수 있고, screen-like 해서 attach / detach 개념으로 로컬 작업 환경을 언제든 되돌아가기 편리하며, remote 서버에 적용할 경우 클라이언트 개념으로 작업 세션을 공유할 수 있음.

적응하는데 시간이 좀 걸리긴해도 적응하면 엄청 편하다.

## Install
### Local MacOS
`brew install tmux`

### Remote Linux server
`sudo apt install tmux`

### .tmux.conf

"prefix"가 C-b인 경우 꽤 불편해서 C-a로 변경하는 것을 추천함. (meta는 기본적으로 alt)

`vim ~/.tmux.conf`, then add below.

```
## Change prefix from 'Ctrl+B' to 'Ctrl+A'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

## Custom Status Style
set -g status-bg cyan
set -g window-status-style bg=yellow
set -g window-status-current-style bg=red,fg=white
```

> remote 서버 prefix 설정과 local 설정을 같은 키로 하면, local session 안에서 remote session을 실행할 때 prefix를 두번 눌러서 실행해야하므로 서로 다르게 설정하는 경우도 있음.

## Usage
### CLI
- `tmux` : create new session
- `tmux ls` : list of tmux sessions
- `tmux a(ttach) -t session_name` : attach session
- `ssh user@host -t tmux a -t main` : remote 서버의'main' 세션 접속

### Session
- `prefix d` : detach
- `prefix $` : rename session
- `Ctrl + d` : kill session and exit

### Window
- `prefix c` : create new window
- `prefix ,` : rename window
- `prefix 0~9 number` : switch window by number
- `prefix p` : pervious window
- `prefix n` : next window
- `prefix &` : kill window

### Pane
- `prefix q` : show pane number
- `prefix %` : horizontal split
- `prefix "` : vertical split
- `prefix meta Up / Down / Left / Right` : Pane resize
- `prefix q number` : show pane number and switch to number
- `prefix Up / Down / Left / Right` : Move
- `prefix space` : rotate layout
- `prefix x` : kill pane

### ETC
After command mode (`prifix :`),  
- Change the status bar background color: `set -g status-bg cyan`
- Change inactive window color: `set -g window-status-style bg=yellow`
- Change active window color: `set -g window-status-current-style bg=red,fg=white`

*(위 설정은 .tmux.conf 에 넣어놔도 됨)*

## Reference
https://github.com/tmux/tmux/wiki/Getting-Started