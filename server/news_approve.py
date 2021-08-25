from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class NewsApproveHandler(tornado.web.RequestHandler):

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
            accountfind=await user_sign_up.find_one({"_id":ObjectId(account_id)})
            
            try:
                if accountfind.get("role")!=1:
                    raise Exception
            except:
                code = 8765
                status = False
                message = "You're not authorized"
                raise Exception      
            # Title
            try:
                newsid = ObjectId(self.request.arguments["newsId"][0].decode())
            except:
                message = " invalid news id."
                raise Exception
            
            newsupdate=await user_news_folder.update_one({
                "_id":newsid
            },
            {
                "$set":{"approve":True,"approvedBy":account_id,"approvedAt":timeNow()}
            })
            code = 2000
            status = True
            message = "News is approved."
            response = {
                "code": code,
                "status": status,
                "message": message,
                "result": result
            }
            self.write(response)
            await self.finish()
            return
        except:
            response = {
                "code": code,
                "status": status,
                "message": message
            }
            self.write(response)
            await self.finish()
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
            accountfind=await user_sign_up.find_one({"_id":ObjectId(account_id)})
            
            try:
                if accountfind.get("role")!=1:
                    raise Exception
            except:
                code = 8765
                status = False
                message = "You're not authorized"
                raise Exception
                
           
            try:
                imageList = user_news_folder.find({"approve":False})
                async for i in imageList:
                    # del[i["image"]]
                    i["image"]=str(i["image"])
                    i['_id'] = str(i['_id'])
                    i["fav_user"] = False
                    if account_id in i["favourites"]:
                        i["fav_user"] = True
                    account_find = await user_sign_up.find_one({"_id": ObjectId(i["AccountId"])})
                    if account_find:
                        i["author"] = account_find["userName"]
                    result.append(i)
                code=2000
                status=True
                message="list of news"
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
