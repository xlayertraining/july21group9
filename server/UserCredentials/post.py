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
        type = ""
        try:
            account_id = await SecureHeader.decrypt(self.request.headers["Authorization"])
            if account_id == None:
                message = "You're not authorized"
                raise Exception
            try:
                image = self.request.files["image"][0]
            except:
                message = "File is not inserted"
                raise Exception
            try:
                imageType = str(self.request.arguments["type"][0].decode())
                if imageType == None or imageType == "":
                    raise Exception
                type = imageType
            except:
                code = 8043
                status = False
                message = "Couldn't get the type name"
                raise Exception
            try:
                postTime = str(self.request.arguments["time"][0].decode())
                if postTime == None or postTime == '':
                    raise Exception
            except:
                code = 8044
                status = False
                message = "Time is invalid"
                raise Exception
            try:
                fileType = str(mimetypes.guess_extension(
                    image['content_type'], strict=True))
                if fileType in [".jpeg", ".jpg", ".png"]:
                    unixTime = str(int(time.time()))
                    fileName = str(imgPath+unixTime+fileType)
                    imageRaw = image['body']
                    try:

                        userImage = await user_image_folder.insert_one({"imageUrl": fileName})
                        if userImage:
                            fh = open(fileName, 'wb')
                            fh.write(imageRaw)
                            fh.close()
                            message = "Image has ben saved"
                            self.write(message)
                        else:
                            print("Not inserted")
                    except:
                        raise Exception

                else:
                    message = "This file type is not supported."

            except:
                raise Exception

        except:
            self.write(message)
# /
    async def get(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:
            get_account_id = await SecureHeader.decrypt(self.request.headers['Authorization'])
            if get_account_id == None:
                code = 3241
                status = False
                message = "Invalid user Session"
                raise Exception
            try:
                post_id = user_image_folder.find({})

                async for i in post_id:
                    i['_id'] = str(i['_id'])
                    result.append(i)
                code = 200
                status = True
                message = "Uploaded images:"
                response = {
                    "code": code,
                    "status": status,
                    "message": message,
                    "result": result
                }
                self.write(response)
            except:
                code = 3232
                status = False
                message = "Internal error!"
                raise Exception
        except:
            response = {
                "code": code,
                "status": status,
                "message": message,
                "result": result
            }
            self.write(response)
