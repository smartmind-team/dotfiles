# dotfiles
.dot

## Tips
### .bashrc vs .bash_profile

`.bashrc`는 non-login shell을 위한 설정으로, ssh 로그인시에는 적용되지 않는다.

즉, ssh login이 되어 있는 상태에서 새로운 shell을 여는 상황(bash, pipenv 등등)에서 적용되는 설정이다.

따라서, 최초 로그인에만 실행할 것들은 `.bash_profile`에서 커스터마이징하여 shell이 열릴 때마다 로딩하지는 말자.

### .hushlogin

home에 이 파일이 존재하면 login시에 나타나는 기본 정보들을 안 볼 수 있다.

### .bash_aliases

`alias`는 매우 유용하게 쓰인다. 정말 개인적으로 사용할 용도의 alias는 `.bash_profile`에 추가해 두자.

새로 열릴 shell도 포함하여 쓰기 위해서는 `.bash_aliases` 파일을 만들고, `.bashrc`를 아래와 같이 `.bash_profile`에 추가하는 것도 한 방법이다.

```sh
# Source bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
```

왜냐하면 기본 설정의 `.bashrc`에서 중간에`.bash_aliases` 파일을 불러오기 때문.

```sh
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```