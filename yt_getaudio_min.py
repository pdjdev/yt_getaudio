#기존 스크립트를 최대한 단순화한 스크립트입니다.

import requests, pafy, webbrowser

title = input('Type Search Keyword(Artist, Title, ...) > ')

def geturl(val):
    s="i.ytimg.com/vi/" 
    return val[val.find(s)+len(s):val.find(s)+len(s)+11]

r = requests.get("https://www.youtube.com/results?search_query="+title+' "topic"').text
video = pafy.new(geturl(r))
url = video.getbestaudio().url
print(str(video) + '\nLink: ' + url)

s = input('Open in browser right now? (yes:y): ')
if s == 'y' or s == 'Y':
	webbrowser.open(url)
