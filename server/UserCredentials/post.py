from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class imageHandler(tornado.web.RequestHandler):
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
                title = self.request.arguments["title"][0].decode()
                if title == None or title == "" or len(title) > 100:
                    raise Exception
            except:
                message = "Please enter valid title.[1-100]"
                raise Exception
            try:
                body = self.request.arguments["body"][0].decode()
                if body == None or body == "" or len(body) > 1000:
                    raise Exception
            except:
                message = "Please enter valid body.[1-1000]"
                raise Exception
            try:
                postTime = int(self.request.arguments["time"][0].decode())
            except:
                postTime = timeNow()

            try:
                image = self.request.files["image"][0]
            except:
                message = "File is not inserted"
                raise Exception
            try:
                catagory = self.request.arguments["category"][0].decode()
                catagory = eval(catagory)
                if catagory == None or type(catagory) != list or not len(catagory):
                    raise Exception
                # type = catagory
            except:
                code = 8043
                status = False
                message = "submit valid category"
                raise Exception

            try:
                fileType = str(mimetypes.guess_extension(
                    image['content_type'], strict=True))
                if fileType in [".jpeg", ".jpg", ".png"]:
                    unixTime = str(timeNow())
                    fileName = str(imgPath+unixTime+fileType)
                    imageRaw = image['body']
                    # try:

                    #     if userImage:
                    #         fh = open(fileName, 'wb')
                    #         fh.write(imageRaw)
                    #         fh.close()
                    #         message = "Image has ben saved"
                    #         self.write(message)
                    #     else:
                    #         print("Not inserted")
                    # except:
                    #     raise Exception

                else:
                    message = "This file type is not supported."

            except:
                raise Exception
            user_news_folder.insert_one({
                "title": title,
                "body": body,
                "publisedTime": postTime,
                "category": catagory,
                "image": imageRaw,
                "AccountId": account_id
            })

        except:
            self.write(message)
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

            try:
                category_id = int(self.request.arguments["category"][0])
            except:
                message = "inValid category"
                raise Exception
            try:
                imageList = user_news_folder.find({"category":category_id})
                async for i in imageList:
                    # del[i["image"]]
                    i["image"]=str(i["image"])
                    # i["image"]=json.loads(i["image"])
                    i['_id'] = str(i['_id'])
                    account_find= await user_sign_up.find_one({"_id":ObjectId(i["AccountId"])})
                    if account_find:
                        i["author"]=account_find["userName"]
                    result.append(i)
                code = 2000
                status = True
                message = "List of images"
                
            except:
                status = False
                if not len(message):
                    code = 5623
                    status = False
                    message = 'Internal Error, Please Contact the Support Team.'
            response = {
                'code': code,
                'status': status,
                'message': message
            }
            try:
                response['result'] = result
                self.write(response)
                self.finish()
                return
            except:
                status = False
                code = 5011
                message = 'Internal Error, Please Contact the Support Team.'
            response = {
                'code': code,
                'status': status,
                'message': message
            }
            self.write(response)
            self.finish()
            return
        except:
            response = {
                'code': code,
                'status': status,
                'message': message
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

            try:
                imageId = ObjectId(self.request.arguments["id"][0].decode())
            except:
                code = 3000
                status = False
                message = "invalid image id"
            proUpdate = user_image_folder.delete_one(
                {
                    "_id": imageId
                },
            )
            code = 2000
            status = True
            message = "Image has been removed"
        except:
            status = False
            if not len(message):
                message = 'Internal Error, Please Contact the Support Team.'
        response = {
            'code': code,
            'status': status,
            'message': message
        }
        try:
            response['result'] = result
            self.write(response)
            self.finish()
            return
        except Exception as e:
            status = False
            code = 5011
            message = 'Internal Error, Please Contact the Support Team.'
            response = {
                'code': code,
                'status': status,
                'message': message
            }
            self.write(response)
            self.finish()
            return
