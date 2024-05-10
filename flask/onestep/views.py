from flask import Flask, render_template, jsonify, Blueprint, Response, request
import torch
import cv2
import numpy as np
from numpy import random
from urllib.request import urlopen
from keras.models import load_model
from keras.layers import DepthwiseConv2D
import torch
import threading
import time
import os
import datetime
from time import sleep

os.chdir(os.path.dirname(os.path.abspath(__file__)))
os.environ['CUDA_VISIBLE_DEVICES'] = '0'


onestep = Blueprint(
    "onestep",
    __name__,
    template_folder="templates", 
    static_folder="static"
)

# ip주소 및 포트 설정
ip = '192.168.137.107'
stream = urlopen('http://' + ip +':81/stream')
buffer = b''

def custom_depthwise_conv2d(*args, **kwargs):
    kwargs.pop('groups', None)  # groups 매개변수 제거
    return DepthwiseConv2D(*args, **kwargs)

# keras 모델 로드
motor_model = load_model(r"C:\\workspaces\\vscode\\keras_model11.h5", custom_objects={'DepthwiseConv2D': custom_depthwise_conv2d}, compile=False)
class_names = open(r"C:\\workspaces\\vscode\\labels11.txt", "r").readlines()

# YOLOv5 모델 로드
img_model = torch.hub.load("C:/Users/gisf4/AppData/Local/Programs/Python/Python312/Lib/site-packages/yolov5", "custom", path="C:\\workspaces\\vscode\\apps\\apps\\onestep\\converted_keras\\best.pt", source='local')

# 차량 상태 및 이미지 플래그 초기화
car_state2 = "go"
thread_frame = None  
image_flag = 0
thread_image_flag = 0
img = None
key = None
auto = True

def yolo_thread():
    global image_flag,thread_image_flag,frame, thread_frame, car_state2
    while True:
        if image_flag == 1:
            thread_frame = frame
            
            # 이미지를 모델에 입력
            results = img_model(thread_frame)

            # 객체 감지 결과 얻기
            detections = results.pandas().xyxy[0]

            if not detections.empty:
                # 결과를 반복하며 객체 표시
                for _, detection in detections.iterrows():
                    x1, y1, x2, y2 = detection[['xmin', 'ymin', 'xmax', 'ymax']].astype(int).values
                    label = detection['name']
                    conf = detection['confidence']

                    print(label)               
                    
                    if "stop" in label and conf > 0.8:
                        print("stop")
                        car_state2 = "stop"
                        urlopen('http://' + ip + '/action?go=stop')
                    elif "speed50" in label and conf >0.6:
                        print("go")
                        car_state2 = "go"
                        urlopen('http://' + ip + "/action?go=speed50")
                    elif "rock" in label and conf >0.85:
                        print("rock")
                        car_state2 = "stop"
                        urlopen('http://' + ip + '/action?go=stop')
                    
                         
                    # 박스와 라벨 표시
                    color = [int(c) for c in random.choice(range(256), size=3)]
                    cv2.rectangle(thread_frame, (x1, y1), (x2, y2), color, 2)
                    cv2.putText(thread_frame, f'{label} {conf:.2f}', (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, color, 2)
            thread_image_flag = 1
            image_flag = 0

def image_process_thread():
    global img, ip, image_flag, car_state2, motor_model, class_names, auto
    
    while True:
        if image_flag == 1:
            img = np.asarray(img, dtype=np.float32).reshape(1, 224, 224, 3)
            img = (img / 127.5) - 1

            # Predict the img_model
            prediction = motor_model.predict(img)
            index = np.argmax(prediction)
            class_name = class_names[index]
            confidence_score = prediction[0][index]
            percent = int(str(np.round(confidence_score * 100))[:-2])

            if auto==True:
                if "go" in class_name[2:] and car_state2 == "go" and percent >= 95:
                    print("직진:", str(np.round(confidence_score * 100))[:-2], "%")
                    urlopen('http://' + ip + "/action?go=forward")
                elif "left" in class_name[2:] and car_state2 == "go" and percent >= 90:
                    print("좌회전:", str(np.round(confidence_score * 100))[:-2], "%")
                    urlopen('http://' + ip + "/action?go=left")     
                elif "right" in class_name[2:] and car_state2 == "go" and percent >= 100:
                    print("우회전:", str(np.round(confidence_score * 100))[:-2], "%")
                    urlopen('http://' + ip + "/action?go=right")
            
            image_flag = 0

@onestep.route('/')
def car():
    return render_template('car.html')

def send_video():
    global thread_frame
    
    while True:
        ret, buffer11 = cv2.imencode('.jpg', thread_frame)
        frame11 = buffer11.tobytes()
        yield (b'--frame\r\n' b'Content-Type: image/jpeg\r\n\r\n' + frame11 + b'\r\n')

@onestep.route('/video')
def video():
    return Response(send_video(), mimetype='multipart/x-mixed-replace; boundary=frame')

@onestep.route('/manual-control', methods=['POST'])
def manual_control():
    global auto
    data = request.get_json()  # POST 요청으로 전달된 JSON 데이터 가져오기
    direction = data.get('direction')  # JSON 데이터에서 주행 방향 가져오기
 
    if auto==False:       

        if direction == 'forward':
            urlopen('http://' + ip + "/action?go=forward")
        elif direction == 'left':
            urlopen('http://' + ip + "/action?go=left") 
        elif direction == 'right':
            urlopen('http://' + ip + "/action?go=right")
        elif direction == 'stop':
            urlopen('http://' + ip + "/action?go=stop")  
        elif direction == 'turn_left':
            urlopen('http://' + ip + "/action?go=turn_left")
        elif direction == 'turn_right':
            urlopen('http://' + ip + "/action?go=turn_right")
        elif direction == 'bleft':
            urlopen('http://' + ip + "/action?go=bleft")
        elif direction == 'backward':
            urlopen('http://' + ip + "/action?go=backward") 
        elif direction == 'bright':
            urlopen('http://' + ip + "/action?go=bright")

    return jsonify(status="success", message=f"수동 주행 - {direction}")

@onestep.route('/light', methods=['POST'])
def light():
    data = request.get_json()  # POST 요청으로 전달된 JSON 데이터 가져오기
    direction = data.get('direction')  # JSON 데이터에서 주행 방향 가져오기

    if direction == 'sos':
            urlopen('http://' + ip + "/action?go=sos")
    elif direction == 'light':
            urlopen('http://' + ip + "/action?go=light")
    elif direction == 'danger':
            urlopen('http://' + ip + "/action?go=danger")

@onestep.route('/speed', methods=['POST'])
def speed():
    data = request.get_json()  # POST 요청으로 전달된 JSON 데이터 가져오기
    direction = data.get('direction')  # JSON 데이터에서 주행 방향 가져오기

    if direction == 'speed40':
            urlopen('http://' + ip + "/action?go=speed40")
    elif direction == 'speed50':
            urlopen('http://' + ip + "/action?go=speed50")
    elif direction == 'speed60':
            urlopen('http://' + ip + "/action?go=speed60")
    elif direction == 'speed80':
            urlopen('http://' + ip + "/action?go=speed80")
    elif direction == 'speed100':
            urlopen('http://' + ip + "/action?go=speed100")

# 주행시작 제어
@onestep.route('/start-driving', methods=['POST'])
def start_driving():
    global auto
    try:
        if auto==False:
            auto=True
            urlopen('http://' + ip + '/action?go=speed50')  # 차량 제어 api
            return jsonify(status="success", message="주행 시작됨")
    except Exception as e:
        return jsonify(status="error", message=str(e))

# 긴급정지 제어
@onestep.route('/stop-driving', methods=['POST'])
def stop_driving():
    global auto
    try:
        if auto==True:
            auto=False
            urlopen('http://' + ip + '/action?go=stop')
            return jsonify(status="success", message="차량 정지됨")
    except Exception as e:
        return jsonify(status="error", message=str(e))


def video_stream():
    global stream, buffer, thread_image_flag, car_state2, image_flag, frame, img

    # 데몬 스레드를 생성합니다.
    t1 = threading.Thread(target=yolo_thread)
    t1.daemon = True 
    t1.start()

    t2 = threading.Thread(target=image_process_thread)
    t2.daemon = True 
    t2.start()

    while True:
        buffer += stream.read(4096)
        head = buffer.find(b'\xff\xd8')
        end = buffer.find(b'\xff\xd9')
        
        if head > -1 and end > -1:
            jpg = buffer[head:end+2]
            buffer = buffer[end+2:]
            img = cv2.imdecode(np.frombuffer(jpg, dtype=np.uint8), cv2.IMREAD_UNCHANGED)

            # 프레임 크기 조정
            frame = cv2.resize(img, (640, 480))

            # 아래부분의 반만 자르기
            height, width, _ = img.shape
            img = img[height // 2:, :]

            img = cv2.resize(img, (224, 224), interpolation=cv2.INTER_AREA)

            cv2.imshow("AI CAR Streaming", img)
            
            image_flag = 1
        
            # 쓰레드에서 이미지 처리가 완료되었으면
            if thread_image_flag == 1:
                # cv2.imshow('thread_frame', thread_frame)
                thread_image_flag = 0

            key = cv2.waitKey(1)
            if key == ord('q'):
                break
            elif key == 32:
                car_state2 = "go"

t3 = threading.Thread(target=video_stream)
t3.daemon = True
t3.start()