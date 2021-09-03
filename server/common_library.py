import tornado.ioloop
import tornado.web
import motor.motor_asyncio
import json
import sys
import re
import mimetypes
import time
import datetime
import os
import requests
import jwt
from bson import ObjectId


def timeNow():
    return int(time.time())

serverUrl = 'http://10.0.2.2:8009/julygroup9_web/api'
# serverUrl = 'http://192.168.43.129:8009/julygroup9_web/api'
# serverUrl = 'https://api.xlayer.in/julygroup9_web/api'
# serverUrl = 'http://localhost:8009/julygroup9_web/api'


# Creating database connection
db_server = motor.motor_asyncio.AsyncIOMotorClient("127.0.0.1", 27017)
db_tableName = db_server["NewsFlix"]
user_sign_up = db_tableName["account"]
user_image_folder = db_tableName["post"]
user_news_folder = db_tableName["news"]
user_comment_folder = db_tableName["comments"]
