from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class PostLikeHandler(tornado.web.RequestHandler):
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
            try:
                post_Id = ObjectId(
                    self.request.arguments['newsId'][0].decode())
            except:
                code = 5683
                status = False
                message = "Invalid Post-Id"
                raise Exception

            post_Find = await user_news_folder.find_one({
                "likers": account_id,
                "_id": post_Id
            })

            if post_Find:
                # like remove
                like_Update = await user_news_folder.update_one({
                    "_id": post_Id
                }, {
                    "$inc": {"like": -1},
                    "$pull": {"likers": account_id}

                })
                status = True
                code = 2000
                message = 'News like is removed.'
                result = []
            else:
                # like is added
                like_Update = await user_news_folder.update_one({
                    "_id": post_Id
                }, {
                    "$inc": {"like": 1},
                    "$push": {"likers": account_id}
                })
                status = True
                code = 2000
                message = 'News is liked'
                result = []
           
        except:
            status = False
            code = 4003
            message = 'Internal Error.'
            result = []

        response = {
            "code": code,
            "status": status,
            "message": message,
            'result': result
        }
        self.write(response)
        await self.finish()
        return
# /
