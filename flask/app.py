from flask import Flask
from flask_cors import CORS

def create_app():
    app = Flask(__name__)
    CORS(app)

    # 블루프린트 등록
    from apps.onestep.views import onestep
    app.register_blueprint(onestep, url_prefix="/onestep")

    # Flask 앱 실행
    if __name__ == '__main__':
        app.run(debug=True, host='0.0.0.0')

    return app