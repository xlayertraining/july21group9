from mimetypes import MimeTypes
from os import stat
from re import T

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
            # Getting user authorization token
            account_id = await SecureHeader.decrypt(self.request.headers["Authorization"])
            if account_id == None:
                code = 4000
                status = False
                message = "You're not authorized"
                raise Exception
            try:
                # provide postId to insert comment on that post
                post_Id = ObjectId(
                    self.request.arguments['postId'][0].decode())
            except:
                code = 4356
                status = False
                message = "Invalid Post Id"
                raise Exception
            try:
                # provide comment to insert on that post
                comment = self.request.arguments["comment"][0].decode()
            except:
                raise Exception

            # inserting all the fields to the database named "comments"

            commentInsert = await user_comment_folder.insert_one({
                "postId": post_Id,
                "comment": comment,
                "accountId": account_id,
                "time": timeNow()
            })
            code = 200
            status = True
            message = "Your comment has been successfully posted"
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
            # Getting user authorization token
            account_id = await SecureHeader.decrypt(self.request.headers["Authorization"])
            if account_id == None:
                message = "You're not authorized"
                raise Exception
            try:
                # provide postId to access comments on that post
                post_Id = ObjectId(
                    self.request.arguments['postId'][0].decode())
            except:
                raise Exception

            # Getting all the available comments on tht post
            commentList = user_comment_folder.find({
                "postId": post_Id,
            })
            # converting objectId's to strings
            async for i in commentList:
                i["_id"] = str(i["_id"])
                i["postId"] = str(i["postId"])
                result.append(i)
            code = 200
            status = True
            message = "All available comments:"
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
