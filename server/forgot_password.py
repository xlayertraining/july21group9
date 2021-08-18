from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class ForgotPasswordHandler(tornado.web.RequestHandler):
    async def post(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:
            try:
                emailAddress = json.loads(self.request.body("email").decode())
            except:
                code = 3523
                status = False
                message = "Invalid email!"
            otp = random.randint(1000, 9999)
            code = 2000
            status = True
            message = otp
            await user_otp_folder.insert_one({
                "otp": otp,
                "emailAddress": emailAddress,
                "createdAt": dtime.now(),
            })
            response = {
                "code": code,
                "status": status,
                "message": message
            }
            self.write(response)
            self.finish()
        except:
            response = {
                "code": code,
                "status": status,
                "message": message
            }
            self.write(response)
            self.finish()
            return
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
                    # del[i["image"]]
                    i["image"] = str(i["image"])
                    i['_id'] = str(i['_id'])
                    i["fav_user"] = False
                    if account_id in i["favourites"]:
                        i["fav_user"] = True
                    account_find = await user_sign_up.find_one({"_id": ObjectId(i["AccountId"])})
                    if account_find:
                        i["author"] = account_find["userName"]
                    result.append(i)
                code = 2000
                status = True
                message = "list of news"
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
                code = 5623
                status = False
                message = 'Internal Error, Please Contact the Support Team.'
                raise Exception
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
