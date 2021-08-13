from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class PostDislikeHandler(tornado.web.RequestHandler):
    async def post(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:
            account_id = await SecureHeader.decrypt(self.request.headers["Authorization"])
            if account_id == None:
                message = "You're not authorized"
                raise Exception
            try:
                post_Id = ObjectId(
                    self.request.arguments['postId'][0].decode())
            except:
                raise Exception
            post_Find = await user_news_folder.find_one({
                "dislikers": account_id,
                "_id": post_Id
            })
            if post_Find:
                dislike_Update = await user_news_folder.update_one({
                    "_id": post_Id
                }, {
                    "$inc": {"dislike": -1},
                    "$pull": {"dislikers": account_id}

                })
            else:
                dislike_Update = await user_news_folder.update_one({
                    "_id": post_Id
                }, {
                    "$inc": {"dislike": 1},
                    "$push": {"dislikers": account_id}
                })
        except:
            response = {
                "code": code,
                "status": status,
                "message": message
            }
            self.write(response)
# /
