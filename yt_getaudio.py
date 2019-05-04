#실행 전 pip 등을 통해 requests, youtube-dl, pafy를 설치해 주세요
#만약 스크립트가 정상적으로 실행되지 않을 경우 'import youtube_dl'을 맨 윗줄에 추가해 주세요

import requests, pafy

print('곡 아티스트, 제목을 입력하세요 (예: Pink Floyd Comfortably Numb)')
title = input('>')

def geturl(val):
    s="i.ytimg.com/vi/" 
    return val[val.find(s)+len(s):val.find(s)+len(s)+11]

print('유튜브 요청 중...')
r = requests.get("https://www.youtube.com/results?search_query="+title+' "topic"').text

print('검색 결과 분석 중...')
url = geturl(r)
video = pafy.new(url)
print('찾은 비디오: ' + video.title + '(' + url + ')')

print('오디오 스트리밍 링크 추출 중...')
bestaudio = video.getbestaudio()

print('링크: ', end='')
print(bestaudio.url)
