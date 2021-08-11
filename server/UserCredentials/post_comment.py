from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class PostCommentHandler(tornado.web.RequestHandler):
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
            try:
                comment = self.request.arguments["comment"][0].decode()
            except:
                raise Exception

            commentInsert = await user_comment_folder.insert_one({
                "postId": post_Id,
                "comment": comment,
                "accountId": account_id,
                "time": timeNow()
            })
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
                message = "You're not authorized"
                raise Exception
            try:
                post_Id = ObjectId(
                    self.request.arguments['postId'][0].decode())
            except:
                raise Exception
            commentList = user_comment_folder.find({
                "postId": post_Id,
            })
            async for i in commentList:
                i["_id"] = str(i["_id"])
                i["postId"] = str(i["postId"])
                result.append(i)
            response = {
                "code": code,
                "status": status,
                "message": message,
                "result": result
            }
            self.write(response)
        except:
            response = {
                "code": code,
                "status": status,
                "message": message,
                "result": result
            }
            self.write(response)
# /
