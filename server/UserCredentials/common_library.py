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
from newsapi import newsapi_client
imgPath = r"D:/xlayer_Tech/july21group9/server/Uploads/"
if os.path.isdir(imgPath) == False:
    os.makedirs(imgPath)
# Creating database connection
db_server = motor.motor_asyncio.AsyncIOMotorClient("127.0.0.1", 27017)
db_tableName = db_server["userCredentials"]
user_sign_up = db_tableName["Account"]
user_image_folder = db_tableName["Post"]
