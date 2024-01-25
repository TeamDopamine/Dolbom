import pandas as pd
import openai
import json
from flask_cors import CORS
from flask import Flask, render_template, request, jsonify, session, redirect
import cx_Oracle
import base64

## [setting] ################################################################

# Openai 연결 설정
openai.organizaion = ''
openai.api_key = ''

# Oracle 연결 설정
oracle_connection = cx_Oracle.connect("campus_23IS_LI1_hack_5", "smhrd5", "project-db-campus.smhrd.com:1524/xe")
cursor = oracle_connection.cursor()

# 명령어 지정
prompt = "Summarize the entire paragraph in Korean to one-third of its original length."

## [함수] ####################################################################

# OpenAI 응답 함수
def get_openai_response(prompt, print_output=False):
    completions = openai.Completion.create(
        engine='gpt-3.5-turbo-instruct',  # 모델 
        temperature=0.5,           
        prompt=prompt,                    # 명령어
        max_tokens=3072,                  # 최대토큰
        n=1,                              # 각 프롬프트에 대해 생성할 완료 수
        stop=None,               
    )

    if print_output:
        print(completions)

    return completions.choices[0].text

# 텍스트 분할 함수
def split_text_700(script):
    chunks = [script[i:i+700] for i in range(0, len(script), 700)]
    
    return chunks

# 쿼리문 지정 함수
def set_qury(start_date, end_date):
    if start_date == end_date:
        query = """
            SELECT edu_content
            FROM tb_daily_record
            WHERE user_id = :userId
                AND class_idx = :classIdx
                AND edu_time >= TO_DATE(:startDate || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                AND edu_time <= TO_DATE(:endDate || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
        """
    else:
        query = """
                SELECT edu_content
                FROM tb_daily_record
                WHERE user_id = :userId
                    AND edu_time BETWEEN TO_DATE(:startDate, 'YYYY-MM-DD') AND TO_DATE(:endDate, 'YYYY-MM-DD')
                    AND class_idx = :classIdx
            """

    return query

# 인코딩, 디코딩 함수
def encode_decode(result):
    # LOB 데이터 타입 변환
    records = [{'edu_content': base64.b64encode(record[0].read().encode('utf-8')).decode('utf-8')} for record in result]
    
    # Base64 디코딩
    all_decoded_content = ""
    for record in records:
        decoded_content = base64.b64decode(record['edu_content']).decode('utf-8')
        all_decoded_content += decoded_content
        
    return all_decoded_content

# 전체 문자열 연결 함수
def connect_contnent(all_decoded_content):
    connectCtx = ''
    for s in all_decoded_content:
        connectCtx += s
        
    return connectCtx

# request 및 response 함수
def request_to_gpt(chunks):
    sum_result = ''
    for s in chunks:
        gpt_request = prompt + s
        gpt_response = get_openai_response(gpt_request)
        sum_result += gpt_response
        
    return sum_result

## [Flask 서버 구동] ##########################################################
app = Flask(__name__)
CORS(app)
@app.route('/getRecord', methods = ['POST'])
def summarize():
    try: 
        data = json.loads(request.get_data())
        user_id = data['user_id']
        class_idx = data['class_idx']
        start_date = data['startDate']
        end_date = data['endDate'] 
        print(f'아이디 : {user_id} | class_idx : {class_idx} | 시작일자 : {start_date} | 종료일자 : {end_date}')
        
        # 쿼리문 실행
        query = set_qury(start_date, end_date)
        cursor.execute(query, {'userId': user_id, 'classIdx' : class_idx, 'startDate': start_date, 'endDate': end_date})
        result = cursor.fetchall()
        print('쿼리문 실행 완료')
        
        # 데이터 변환 작업
        all_decoded_content = encode_decode(result)
        connectCtx = connect_contnent(all_decoded_content)
        chunks = split_text_700(connectCtx)

        # gpt 사용
        print('gpt 돌아가는중')
        sum_result = request_to_gpt(chunks)
        response = jsonify({'data': sum_result})
        
        print('요약 완료')
        return response

    # 에러가 발생시 처리
    except Exception as e:
        response = jsonify({'error': str(e)})
        response.status_code = 500
        return response

if __name__ == '__main__':
    try:
        app.run(host='0.0.0.0', port=8089)
    finally:
        # 서버 종료 시 커넥션과 커서 닫기
        cursor.close()
        oracle_connection.close()