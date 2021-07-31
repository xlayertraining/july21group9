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
from bson import ObjectId
from newsapi import newsapi_client
# Creating database connection 
db_server=motor.motor_asyncio.AsyncIOMotorClient("127.0.0.1",27017)
db_tableName=db_server["userCredentials"]
user_sign_up=db_tableName["SignIn"]
