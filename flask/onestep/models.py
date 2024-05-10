# import cx_Oracle


# # db 연결
# def get_db_connection():
#     username = 'onestep'
#     password = 'onestep'
#     dsn = '192.168.0.145:1521/xe'
#     return cx_Oracle.connect(username, password, dsn)

# class ImageDetect:
#     def __init__(self, image_id, history_num, image_path, is_detected):
#         self.image_id = image_id
#         self.history_num = history_num
#         self.image_path = image_path
#         self.is_detected = is_detected

#     def save_to_db(self):
#         connection = get_db_connection()
#         cursor = connection.cursor()
#         try:
#             # IMAGE_DETECT 테이블에 감지된 이미지 데이터 저장
#             cursor.execute(
#                 "INSERT INTO IMAGE_DETECT (IMAGE_ID, HISTORY_NUM, IMAGE_PATH, IS_DETECTED, CREATED_AT) VALUES (:1, :2, :3, :4, SYSDATE)",
#                 (self.image_id, self.history_num, self.image_path, self.is_detected)
#             )
#             connection.commit()
#         except Exception as e:
#             print(f"Error saving detection to DB: {e}")
#         finally:
#             cursor.close()
#             connection.close()

# class DetectedTag:
#     def __init__(self, tag_id, image_id, tag_name):
#         self.tag_id = tag_id
#         self.image_id = image_id
#         self.tag_name = tag_name

#     def save_to_db(self):
#         connection = get_db_connection()
#         cursor = connection.cursor()
#         try:
#             # IMAGE_DETECTED_TAG 테이블에 이미지 태그 데이터 저장
#             cursor.execute(
#                 "INSERT INTO IMAGE_DETECTED_TAG (TAG_ID, IMAGE_ID, TAG_NAME, CREATED_AT) VALUES (:1, :2, :3, SYSDATE)",
#                 (self.tag_id, self.image_id, self.tag_name)
#             )
#             connection.commit()
#         except Exception as e:
#             print(f"Error saving tag to DB: {e}")
#         finally:
#             cursor.close()
#             connection.close()
