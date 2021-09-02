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
            if account_id == None or account_id == '':
                code = 8765
                status = False
                message = "You're not authorized"
                raise Exception
            try:
                post_Id = ObjectId(
                    self.request.arguments["newsId"][0].decode())
                print('Hi')
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
                # remove dislike
                dislike_Update = await user_news_folder.update_one({
                    "_id": post_Id
                }, {
                    "$set": {"dislike": 0},
                    "$pull": {"dislikers": account_id}

                })
                status = True
                code = 2000
                message = 'News is liked.'
                result = []

        except Exception as e:
            template = 'Exception: {0}. Argument: {1!r}'
            iMessage = template.format(type(e).__name__, e.args)
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = exc_tb.tb_frame.f_code.co_filename
            print('EXC', iMessage)
            print('EX2', 'FILE: ' + str(fname) + ' LINE: ' +
                  str(exc_tb.tb_lineno) + ' TYPE: ' + str(exc_type))

        response = {
            'code': code,
            'status': status,
            'message': message,
            "result": result
        }
        self.write(response)
        await self.finish()
# /
