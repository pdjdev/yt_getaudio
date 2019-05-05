REM Windows 환경에서 Python 3와 pip 가 설치된 조건 하에 자동으로
REM 스크립트를 실행할 수 있도록 환경을 만들어주는 배치 파일입니다.
REM 배치 파일 안에 파이썬 스크립트가 있기 때문에 이 파일만 실행하면
REM 자동으로 .py 파일이 생성됩니다.

@echo off
echo 스크립트 로드 중...

echo import requests, pafy, webbrowser >ytga.py
echo from argparse import ArgumentParser >>ytga.py
echo def geturl(val): >>ytga.py
echo     s="i.ytimg.com/vi/"  >>ytga.py
echo     return val[val.find(s)+len(s):val.find(s)+len(s)+11] >>ytga.py
echo parser = ArgumentParser() >>ytga.py
echo parser.add_argument("-q") >>ytga.py
echo args = parser.parse_args() >>ytga.py
echo title = args.query >>ytga.py
echo r = requests.get("https://www.youtube.com/results?search_query="+title+' "topic"').text >>ytga.py
echo video = pafy.new(geturl(r)) >>ytga.py
echo url = video.getbestaudio().url >>ytga.py
echo print('\n=== 조회 결과 ===\n'+str(video)) >>ytga.py
echo webbrowser.open(url) >>ytga.py

echo 파이썬 설치 확인 중...
python --version | find "Python 3"
if %ERRORLEVEL% == 1 goto nopy
echo pip 설치 확인 중...
pip --version >nul
if %ERRORLEVEL% == 9009 goto nopip
echo 파이썬 모듈 설치 확인중...
pip list | find "requests"
if %ERRORLEVEL% == 1 goto inst
pip list | find "youtube-dl"
if %ERRORLEVEL% == 1 goto inst
pip list | find "pafy"
if %ERRORLEVEL% == 1 goto inst

goto main

:inst
echo 필요한 패키지가 설치되어 있지 않습니다. 설치를 진행합니다.
pip install requests youtube_dl pafy
goto main

:nopy
echo 파이썬이 설치되어 있지 않은 것 같습니다. 설치 후 다시 실행해 주세요.
pause
exit

:nopip
echo pip가 설치되어 있지 않은 것 같습니다. 설치 후 다시 실행해 주세요.
pause
exit

:main
cls
color 0f
set /p que="검색 쿼리 입력 (아티스트, 곡 제목, ...): "
ytga.py -q "%que%"
pause
