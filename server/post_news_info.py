from common_library import*


class NewsInfoHandler(tornado.web.RequestHandler):
    async def get(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:

            # Category
            try:
                newsId = ObjectId(
                    self.request.arguments["newsId"][0].decode())
            except:
                message = "Invalid newsId"
                raise Exception
            try:
                imageList = user_news_folder.find(
                    {"_id": newsId},
                )
                print(newsId)
                async for i in imageList:
                    account_find = await user_sign_up.find_one({"_id": ObjectId(i["accountId"])})
                    if account_find:
                        i["author"] = account_find["userName"]
                    i['_id'] = str(i['_id'])

                    del[i['createdBy'], i['favourites'], i['like'], i['likers'], i['dislike'],
                        i['dislikers'], i['tags'], i['category'], i['approve'],i['approvedBy'], i['approvedAt']]
                   
                    
                    # adding image url
                    i['imageUrl'] = None
                    if len(i['attachments']) > 0:
                        i['imageUrl'] = serverUrl + '/news/image/' + i['attachments'][0]['fileName']
                        del i['attachments']

                    result.append(i)
                code = 2000
                status = True
                message = "list of news"
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
                iMessage = template.format(type(e)._name_, e.args)
                message = 'Internal Error, Please Contact the Support Team.'
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = exc_tb.tb_frame.f_code.co_filename
                print('EXC', iMessage)
                print('EX2', 'FILE: ' + str(fname) + ' LINE: ' +
                      str(exc_tb.tb_lineno) + ' TYPE: ' + str(exc_type))
                raise Exception

        except Exception as e:
            template = 'Exception: {0}. Argument: {1!r}'
            iMessage = template.format(type(e)._name_, e.args)
            message = 'Internal Error, Please Contact the Support Team.'
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