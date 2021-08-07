from mimetypes import MimeTypes
from common_library import*


class imageHandler(tornado.web.RequestHandler):
    async def post(self):
        code = 4000
        status = False
        message = ""
        result = []
        type = ""
        try:
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
                print(type)
            except:
                code = 8043
                status = False
                message = "Couldn't get the type name"
                raise Exception
            try:
                postTime=str(self.request.arguments["time"][0].decode())
                if postTime==None or postTime=='':
                    raise Exception
            except:
                code=8044
                status=False
                message="Time is invalid"
                raise Exception
            try:
                fileType = str(mimetypes.guess_extension(
                    image['content_type'], strict=True))
                print(fileType)
                if fileType in [".jpeg", ".jpg", ".png"]:
                    unixTime = str(int(time.time()))
                    fileName = imgPath+unixTime+fileType
                    print(fileName)
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
