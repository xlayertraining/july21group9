from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class SearchNewsHandler(tornado.web.RequestHandler):

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
            try:
                keyword = self.request.arguments["keyword"][0].decode()
            except:
                code = 3289
                status = False
                message="Enter Valid keyword"
                raise Exception

            news_List = user_news_folder.find({
                "$or": [
                    {
                        "title": {
                            "$regex": keyword,
                            "$options": "i"
                        }
                    },
                    {
                        "description": {
                            "$regex": keyword,
                            "$options": "i"
                        }
                    }
                ]
            })
            async for i in news_List:
                # del[i["image"]]
                i["image"] = str(i["image"])
                i['_id'] = str(i['_id'])
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
# /
