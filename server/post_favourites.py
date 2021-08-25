from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class Postfavouriteshandler(tornado.web.RequestHandler):
    async def post(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:
            account_id = await SecureHeader.decrypt(self.request.headers["Authorization"])
            if account_id == None:
                code = 4000
                status = False
                message = "You're not authorized"
                raise Exception
            try:
                post_Id = ObjectId(
                    self.request.arguments['newsId'][0].decode())
            except:
                code = 3920
                status = False
                message = "Invalid Post Id"
                raise Exception

            post_Find = await user_news_folder.find_one({
                "favourites": account_id,
                "_id": post_Id
            })
            if post_Find:
                favourites_Update = await user_news_folder.update_one({
                    "_id": post_Id
                }, {
                    "$pull": {"favourites": account_id}

                })
                code = 200
                status = True
                message = "Removed from favourites"
            else:
                favourites_Update = await user_news_folder.update_one({
                    "_id": post_Id
                }, {
                    "$push": {"favourites": account_id}
                })
                code = 200
                status = True
                message = "Added to favourites"

            response = {
                "code": code,
                "status": status,
                "message": message,
                "result":result
            }
            self.write(response)
            self.finish()
            return
        except:
            response = {
                "code": code,
                "status": status,
                "message": message,
                "result":result
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
                code = 4000
                status = False
                message = "You're not authorized"
                raise Exception

            post_List = user_news_folder.find({
                "favourites": account_id
            })
            async for i in post_List:
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
            response = {
                "code": code,
                "status": status,
                "message": message,
                "result": result
            }
            self.write(response)
            self.finish()
            return
        except:
            response = {
                "code": code,
                "status": status,
                "message": message,
                "result": result
            }
            self.write(response)
            self.finish()
            return