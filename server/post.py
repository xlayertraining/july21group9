from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class NewsHandler(tornado.web.RequestHandler):

    async def post(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:
            print ('hi')
            account_id = await SecureHeader.decrypt(self.request.headers["Authorization"])
            if not account_id:
                code = 8765
                status = False
                message = "You're not authorized"
                raise Exception

            accountfind=user_sign_up.find_one({"_id":ObjectId(account_id)})
            try:
                if accountfind.get("role")==1:
                    approve=True
                else:
                    approve=False
            except:
                approve=False        
            # Title
            try:
                title = self.request.arguments["title"][0].decode()
                if title == None or title == "" or len(title) > 100:
                    raise Exception
            except:
                message = "Please enter valid title.[1-100]"
                raise Exception
            # Description
            try:
                body = self.request.arguments["description"][0].decode()
                if body == None or body == "" or len(body) > 1000:
                    raise Exception
            except:
                message = "Please enter valid body.[1-1000]"
                raise Exception
            # Time
            try:
                postTime = int(self.request.arguments["time"][0].decode())
            except:
                postTime = timeNow()
            
            # Category
            try:
                val = self.request.arguments["category"][0]
                catagory = None
                
                if (type(val) == bytes):
                    catagory = self.request.arguments["category"][0].decode()
                    catagory = eval(catagory)
                else:
                    catagory = self.request.arguments["category"][0]

                if catagory == None or type(catagory) != list or not len(catagory):
                    raise Exception
                # type = catagory
            except:
                code = 8043
                status = False
                message = "submit valid category"
                raise Exception
            try:
                tags = self.request.arguments["tags"][0].decode()
                tags = eval(tags)
                if tags == None or type(tags) != list or not len(tags):
                    raise Exception
            except:
                tags=[]

            # Image
            attach = []
            try:
                image = self.request.files["image"][0]
            except:
                image=None

            if image is not None: 
                try:
                    fileType = str(mimetypes.guess_extension(
                        image['content_type'], strict=True))
                    if fileType in [".jpeg", ".jpg", ".png"]:
                        imageRaw = image['body']
                except:
                    code = 4083
                    status = False
                    message = "This file type is not supported"
                    raise Exception

                attach = [
                        {
                            'rawFile': imageRaw,
                            'extention': fileType,
                            'mimeType': image['content_type'],
                            'fileName': str(timeNow()) + fileType
                        }
                    ]
            else:
                attach = []

            try:
                rs = await user_news_folder.insert_one({
                    "accountId": account_id,
                    "createdBy": account_id,
                    "createdAt": postTime,
                    "title": title,
                    "description": body,
                    "favourites": [],
                    "like": 0,
                    "likers": [],
                    "dislike":0,
                    "dislikers":[],
                    "tags":tags,
                    "category": catagory,
                    "approve": approve,
                    "approvedBy":None,
                    "approvedAt":None,
                    'attachments': attach
                    
                })
                #NewsId in result
                result.append(str(rs.inserted_id))
            except:
                code = 4000
                status = False
                message = "Problem in database"
            code = 2000
            status = True
            message = "News is created."
            response = {
                "code": code,
                "status": status,
                "message": message,
                "result": result
            }
            self.write(response)
            await self.finish()
            return
        except Exception as e:
            template = 'Exception: {0}. Argument: {1!r}'
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
            await self.finish()
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
                code = 8765
                status = False
                message = "You're not authorized"
                raise Exception
            # Category
            try:
                category_id = int(
                    self.request.arguments["category"][0].decode())
            except:
                message = "Invalid category"
                raise Exception
            try:
                imageList = user_news_folder.find(
                        {"category": category_id,"approve":True},
                    )
                async for i in imageList:
                    del[i['likers'], i['dislikers'], i['category'], i['description'],i['createdBy'],i['approvedAt']]
                    i['_id'] = str(i['_id'])
                    i["fav_user"] = False
                    if account_id in i["favourites"]:
                        i["fav_user"] = True
                    else:
                        del i['favourites']
                    account_find = await user_sign_up.find_one({"_id": ObjectId(i["accountId"])})
                    if account_find:
                        i["author"] = account_find["userName"]
                   
                    
                    # adding image url
                    i['imageUrl'] = None
                    if len(i['attachments']) > 0:
                        i['imageUrl'] = serverUrl + '/news/image/' + i['attachments'][0]['fileName']
                        del i['attachments']

                    result.append(i)
                code=2000
                status=True
                message="list of news"
                response = {
                    'code': code,
                    'status': status,
                    'message': message,
                    "result": result
                }
                self.write(response)
                self.finish()
                return
            except Exception as e:
                code = 5623
                status = False
                message = 'Internal Error, Please Contact the Support Team.'
                template = 'Exception: {0}. Argument: {1!r}'
                iMessage = template.format(type(e).__name__, e.args)
                message = 'Internal Error, Please Contact the Support Team.'
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = exc_tb.tb_frame.f_code.co_filename
                print('EXC', iMessage)
                print('EX2', 'FILE: ' + str(fname) + ' LINE: ' + str(exc_tb.tb_lineno) + ' TYPE: ' + str(exc_type))
                raise Exception
        
        except Exception as e:
            template = 'Exception: {0}. Argument: {1!r}'
            iMessage = template.format(type(e).__name__, e.args)
            message = 'Internal Error, Please Contact the Support Team.'
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = exc_tb.tb_frame.f_code.co_filename
            print('EXC', iMessage)
            print('EX2', 'FILE: ' + str(fname) + ' LINE: ' + str(exc_tb.tb_lineno) + ' TYPE: ' + str(exc_type))

        response = {
            'code': code,
            'status': status,
            'message': message,
            "result": result
        }
        self.write(response)
        self.finish()
        return

    async def delete(self):
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
            # NewsId
            try:
                newsId = ObjectId(self.request.arguments["newsId"][0].decode())
            except:
                code = 3000
                status = False
                message = "Invalid news id"
                raise Exception
            proUpdate = await user_news_folder.delete_one(
                {
                    "_id": newsId
                },
            )
            code = 2000
            status = True
            message = "news has been removed"
        except:
            code = 6754
            status = False
            message = 'Internal Error, Please Contact the Support Team.'

        try:
            response = {
                'code': code,
                'status': status,
                'message': message,
                "result": result
            }
            self.write(response)
            self.finish()
            return
        except Exception as e:
            status = False
            code = 5011
            template = 'Exception: {0}. Argument: {1!r}'
            iMessage = template.format(type(e).__name__, e.args)
            message = 'Internal Error, Please Contact the Support Team.'
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = exc_tb.tb_frame.f_code.co_filename
            print('EXC', iMessage)
            print('EX2', 'FILE: ' + str(fname) + ' LINE: ' + str(exc_tb.tb_lineno) + ' TYPE: ' + str(exc_type))

        response = {
            'code': code,
            'status': status,
            'message': message,
            "result": result
        }
        self.write(response)
        self.finish()
        return
