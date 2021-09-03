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
                "result": result
            }
            self.write(response)
            self.finish()
            return
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
                i['_id'] = str(i['_id'])
                i["fav_user"] = False
                if account_id in i["favourites"]:
                    i["fav_user"] = True
                del[i['dislike'], i['like'], i['likers'], i['dislikers'], i['tags'],
                    i['approve'], i['createdAt'], i['approvedBy'], i['approvedAt'], i['category']]
                account_find = await user_sign_up.find_one({"_id": ObjectId(i["accountId"])})
                if account_find:
                    i["author"] = account_find["userName"]
                # adding image url
                    i['imageUrl'] = None
                    if len(i['attachments']) > 0:
                        i['imageUrl'] = serverUrl + '/news/image/' + \
                            i['attachments'][0]['fileName']
                        del i['attachments']
                result.append(i)
            code = 200
            status = True
            message = "All Favourites news"
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
