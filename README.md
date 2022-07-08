# dotfiles

.dot

## Tips

### .bashrc vs .bash_profile

`.bashrc`는 non-login shell을 위한 설정으로, ssh 로그인시에는 적용되지 않습니다.

즉, ssh login이 되어 있는 상태에서 새로운 shell을 여는 상황(bash, pipenv 등등)에서 적용되는 설정입니다.

따라서, 최초 로그인에만 실행할 것들은 `.bash_profile`에서 커스터마이징하여 shell이 열릴 때마다 로딩하지 않는 것을 권합니다.

### .hushlogin

home에 이 파일이 존재하면 login시에 나타나는 기본 정보들을 안 볼 수 있습니다.

### .bash_aliases

`alias`는 매우 유용하게 쓰인다. 정말 개인적으로 사용할 용도의 alias는 `.bash_profile`에 추가해 두는게 좋습니다.

새로 열릴 shell도 포함하여 쓰기 위해서는 `.bash_aliases` 파일을 만들고, `.bashrc`를 아래와 같이 `.bash_profile`에 추가하는 것도 한 방법입니다.

```sh
# Source bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
```

왜냐하면 기본 설정의 `.bashrc`에서 중간에`.bash_aliases` 파일을 불러오기 때문 입니다.

```sh
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```

### .condarc

anaconda 또는 miniconda의 설정 파일입니다. [공식문서](https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html)

```yaml
channels:
  - conda-forge
  - defaults
```

위 처럼 설정하면 `conda install` 명령의 기본 채널이 `conda-forge`로 설정됩니다.

### pyproject.toml

[PEP-518]에서 처음 등장한 build-time dependency를 선언적으로 관리하기 위해 추가된 파일.

용도가 확장되어 black, isort, mypy, pytest등의 툴들도 설정 파일료 `pyproject.toml`파일을 이용하고 있습니다. (flake8은 지원안함)

예시 파일은 [FastAPI](https://github.com/tiangolo/fastapi)의 pyproject 파일입니다.

[참고문서](https://tech.buzzvil.com/blog/setup.py-%EB%A9%88%EC%B6%B0/)

### .flake8

python linter중 하나인 [flake8](https://flake8.pycqa.org/en/latest/index.html)의 설정 파일입니다.

예시 파일은 [black](https://github.com/psf/black/blob/main/.flake8)에서 제시한 black과의 호환을 위한 flake8 설정 파일입니다.

### .pre-commit-config.yaml

[pre-commit](https://pre-commit.com/)의 설정 파일 입니다.
