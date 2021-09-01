from common_library import*
from auth import SecureHeader


class UserSharedPostHandler(tornado.web.RequestHandler):

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
                post_List = user_news_folder.find(
                    {"accountId": account_id})

                async for i in post_List:
                    del[i["createdBy"], i["favourites"], i["like"], i["likers"], i["dislike"],
                        i["dislikers"], i["tags"], i["category"], i["approve"], i["approvedBy"], i["approvedAt"]]
                    i['_id'] = str(i['_id'])
                    i["accountId"] = str(i["accountId"])
                    i['imageUrl'] = None
                    if len(i['attachments']) > 0:
                        i['imageUrl'] = serverUrl + '/news/image/' + \
                            i['attachments'][0]['fileName']
                        del i['attachments']
                    result.append(i)
                code = 2000
                status = True
                message = "Published posts"

            except:
                code = 5623
                status = False
                message = 'Internal Error, Please Contact the Support Team.'
                raise Exception
            response = {
                'code': code,
                'status': status,
                'message': message,
                'result': result
            }
            self.write(response)
            await self.finish()
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
