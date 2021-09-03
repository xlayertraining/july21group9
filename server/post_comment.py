from mimetypes import MimeTypes
from os import stat
from re import T
from sys import hash_info

from tornado.locale import get
from common_library import*
from auth import SecureHeader
# from log_util import Log


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
                    self.request.arguments['newsId'][0].decode())
                
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
                "newsId": post_Id,
                "comment": comment,
                "creatorId":  ObjectId(account_id),
                "createdAt": timeNow()
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
        except Exception as e:
            template = 'Exception: {0}. Argument: {1!r}'
            code = 5011
            iMessage = template.format(type(e).__name__, e.args)
            message = 'Internal Error, Please Contact the Support Team.'
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = exc_tb.tb_frame.f_code.co_filename
            print('EXC', iMessage)
            print('EX2', 'FILE: ' + str(fname) + ' LINE: ' + str(exc_tb.tb_lineno) + ' TYPE: ' + str(exc_type))

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
            # Getting user authorization token
            account_id = await SecureHeader.decrypt(self.request.headers["Authorization"])
            if account_id == None:
                code=4000
                status=False
                message = "You're not authorized"
                raise Exception
            try:
                # provide postId to access comments on that post
                post_Id = ObjectId(
                    self.request.arguments['newsId'][0].decode())
            except:
                code=3920
                status=False
                message="Invalid Post Id"
                raise Exception

            
            # Getting all the available comments on tht post
            commentList = user_comment_folder.find({
                "newsId": post_Id,
            })
            # converting objectId's to strings
            async for i in commentList:
                i["_id"] = str(i["_id"])
                i["newsId"] = str(i["newsId"])
                i["creatorId"]=str(i["creatorId"])
                account_find=await user_sign_up.find_one({"_id":ObjectId(i["creatorId"])})
                if account_find:
                    i["createdBy"]=account_find["userName"]
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
            self.finish()
            return
        except Exception as e:
            template = 'Exception: {0}. Argument: {1!r}'
            code = 5011
            iMessage = template.format(type(e).__name__, e.args)
            message = 'Internal Error, Please Contact the Support Team.'
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = exc_tb.tb_frame.f_code.co_filename
            print('EXC', iMessage)
            print('EX2', 'FILE: ' + str(fname) + ' LINE: ' + str(exc_tb.tb_lineno) + ' TYPE: ' + str(exc_type))

            response = {
                "code": code,
                "status": status,
                "message": message
            }
            self.write(response)
            self.finish()
            return
# /
