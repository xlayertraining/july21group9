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
                post_List = user_news_folder.find({"AccountId":account_id})
                async for i in post_List:
                    del[i["image"]]
                    # i["image"]=str(i["image"])
                    i['_id'] = str(i['_id'])
                    i["AccountId"]=str(i["AccountId"])
                    result.append(i)
                code = 2000
                status = True
                message = "Shared News"
                
            except:
                status = False
                if not len(message):
                    code = 5623
                    status = False
                    message = 'Internal Error, Please Contact the Support Team.'
            response = {
                'code': code,
                'status': status,
                'message': message,
                'result':result
            }
            self.write(response)
            self.finish()
            return
        except:
            response = {
                'code': code,
                'status': status,
                'message': message,
                "result":result
            }
            self.write(response)
            self.finish()
            return
