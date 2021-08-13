from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class imageHandler(tornado.web.RequestHandler):
    async def post(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:
            account_id = await SecureHeader.decrypt(self.request.headers["Authorization"])
            if account_id == None:
                code = 8765
                status = False
                message = "You're not authorized"
                raise Exception
            # Title
            try:
                title = self.request.arguments["title"][0].decode()
                if title == None or title == "" or len(title) > 100:
                    raise Exception
            except:
                message = "Please enter valid title.[1-100]"
                raise Exception
            # Description
            try:
                body = self.request.arguments["description"][0].decode()
                if body == None or body == "" or len(body) > 1000:
                    raise Exception
            except:
                message = "Please enter valid body.[1-1000]"
                raise Exception
            # Time
            try:
                postTime = int(self.request.arguments["time"][0].decode())
            except:
                postTime = timeNow()
            # Image
            try:
                image = self.request.files["image"][0]
            except:
                message = "File is not inserted"
                raise Exception
            # Category
            try:
                catagory = self.request.arguments["category"][0].decode()
                catagory = eval(catagory)
                if catagory == None or type(catagory) != list or not len(catagory):
                    raise Exception
                # type = catagory
            except:
                code = 8043
                status = False
                message = "submit valid category"
                raise Exception

            try:
                fileType = str(mimetypes.guess_extension(
                    image['content_type'], strict=True))
                if fileType in [".jpeg", ".jpg", ".png"]:
                    imageRaw = image['body']
            except:
                code = 4083
                status = False
                message = "This file type is not supported"
                raise Exception

            user_news_folder.insert_one({
                "title": title,
                "description": body,
                "like": 0,
                "likers": [],
                "publisedTime": postTime,
                "category": catagory,
                "image": imageRaw,
                "AccountId": account_id
            })
            code = 2000
            status = True
            message = "News posted."
            response = {
                "code": code,
                "status": status,
                "message": message
            }
            self.write(response)
        except:
            response = {
                "code": code,
                "status": status,
                "message": message
            }
            self.write(response)
# /

    async def get(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:

            account_id = await SecureHeader.decrypt(self.request.headers["Authorization"])
            if account_id == None:
                code = 8765
                status = False
                message = "You're not authorized"
                raise Exception
            # Category
            try:
                category_id = int(
                    self.request.arguments["category"][0].decode())
            except:
                message = "Invalid category"
                raise Exception
            try:
                imageList = user_news_folder.find({"category": category_id})
                async for i in imageList:
                    del[i["image"]]
                    # i["image"]=str(i["image"])
                    i['_id'] = str(i['_id'])
                    i["fav_user"] = False
                    if account_id in i["favourites"]:
                        i["fav_user"] = True
                    account_find = await user_sign_up.find_one({"_id": ObjectId(i["AccountId"])})
                    if account_find:
                        i["author"] = account_find["userName"]
                    result.append(i)

            except:
                code = 5623
                status = False
                message = 'Internal Error, Please Contact the Support Team.'
                raise Exception

            code = 2000
            status = True
            message = "List of images"
            response = {
                'code': code,
                'status': status,
                'message': message,
                "result": result
            }
            self.write(response)
            self.finish()
            return
        except:
            response = {
                'code': code,
                'status': status,
                'message': message,
                "result": result
            }
            self.write(response)
            self.finish()
            return

    async def delete(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:

            account_id = await SecureHeader.decrypt(self.request.headers["Authorization"])
            if account_id == None:
                code = 8765
                status = False
                message = "You're not authorized"
                raise Exception
            # NewsId
            try:
                newsId = ObjectId(self.request.arguments["id"][0].decode())
            except:
                code = 3000
                status = False
                message = "invalid news id"
                raise Exception
            proUpdate = await user_news_folder.delete_one(
                {
                    "_id": newsId
                },
            )
            code = 2000
            status = True
            message = "news has been removed"
        except:
            code = 6754
            status = False
            message = 'Internal Error, Please Contact the Support Team.'

        try:
            response = {
                'code': code,
                'status': status,
                'message': message,
                "result": result
            }
            self.write(response)
            self.finish()
            return
        except:
            status = False
            code = 5011
            message = 'Internal Error, Please Contact the Support Team.'
            response = {
                'code': code,
                'status': status,
                'message': message,
                "result": result
            }
            self.write(response)
            self.finish()
            return
