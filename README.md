# THE(TodayHighlighEnglish)

- SpringPRJ -> src -> poly 에 들어가시면 서버코드
- SpringPRJ -> WebContent -> WEB-INF -> view 에 들어가면 jps코드 확인 가능합니다. 

## 빅데이터분석을 활용한 English learning App(자연어처리, 강세분석)

시연 영상 : [![](https://i.ytimg.com/vi/byTrpJJPjNo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLBcRHXMkvEdoZIWLXNBhRXRNf5KzA)](https://www.youtube.com/watch?v=byTrpJJPjNo&t "demo")

## 적용 기술
        - 프레임워크 : SpringFramework
        - 데이터베이스 : MySQL, MongoDB
        - 클라우드 환경 : Amazon Web Service
        - 개발 언어 : Java, Python
        - 개발 기술 : Java, Jsoup(웹 크롤링), CoreNLP(자연어 처리), Google TTS, Python Parselmouth(음성 인식 및 강세 분석)
        - 에디터 : Eclipse
        
## 기능

1. 뉴스기사
        - Java Jsoup 라이브러리를 활용한 웹 크롤링을 통해 각종 영문뉴스 웹사이트(코리아헤럴드 등)에서 수집한 최신 영문뉴스 기사의 유용한 단어 및 표현을 추출하여 매일 사용자에 제공함

2. 사용자 맞춤 서비스
        - 사용자의 학습 데이터(학습 목표, 오답 등)를 분석(CoreNLP 자연어처리)하여 사용자 맞춤형 영어단어 및 표현 학습자료를 제공함
        - 자연어처리는 Stanford CoreNLP를 활용하여 영어 문장에서 원형의 형태로 자연어처리하여 mongoDB에 저장 (문장 -> 토큰 -> 동사원형) 
3. 강세 분석 및 평가
        - 영어 강세 교정기술은 Python Parselmouth 음정 분석 알고리즘을 활용하여 사용자의 영어 발음 및 강세를 음절 단위로 분석 및 평가하여 교정 방향을 제시함

News article 
- Extract useful words and expressions from the latest English news articles collected from various English news websites (Korea Herald, etc.) through web crawling using the Java Jsoup library and provide them to users every day.

Customized service
- It analyzes the user's learning data (learning goals, incorrect answers, etc.) and provides user-customized English words and expression learning materials.
- Natural language processing uses Stanford CoreNLP to naturally process in circular form in English sentences and store it in MongoDB (sentence -> token -> verb type)

accent analysis and evaluation 
- The accent English correction technology uses the Python Parsmelmouth pitch analysis algorithm to analyze and evaluate the user's English pronunciation and strength in syllable units and suggest correction directions.

### 프로젝트 기간
        - 2020-05-01 ~ 2020-11-10  
