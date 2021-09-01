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
                    self.request.arguments['newsId'][0].decode())
            except:
                raise Exception
            post_Find = await user_news_folder.find_one({
                "dislikers": account_id,
                "_id": post_Id
            })
            if post_Find:
                # remove dislike
                dislike_Update = await user_news_folder.update_one({
                    "_id": post_Id
                }, {
                    "$inc": {"dislike": -1},
                    "$pull": {"dislikers": account_id}

                })
                status = True
                code = 2000
                message = 'dislike has been removed.'
                result = []

            else:
                # Add dislike
                dislike_Update = await user_news_folder.update_one({
                    "_id": post_Id
                }, {
                    "$inc": {"dislike": 1},
                    "$push": {"dislikers": account_id}
                })

                # remove like
                like_Update = await user_news_folder.update_one({
                    "_id": post_Id
                }, {
                    "$set": {"like": 0},
                    "$pull": {"likers": account_id}

                })
                status = True
                code = 2000
                message = 'you disliked this news'
                result = []

            response = {
                "code": code,
                "status": status,
                "message": message,
                "result":result
            }
            self.write(response)
            await self.finish()
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
            self.finish()
            return
# /
