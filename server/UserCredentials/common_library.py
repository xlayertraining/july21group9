import tornado.ioloop
import tornado.web
import motor.motor_asyncio
import json
import os
import sys
import re
import time
import mimetypes
import requests
from bson import ObjectId
# Creating database connection 
db_server=motor.motor_asyncio.AsyncIOMotorClient("127.0.0.1",27017)
db_tableName=db_server["userCredentials"]
user_sign_up=db_tableName["SignIn"]
