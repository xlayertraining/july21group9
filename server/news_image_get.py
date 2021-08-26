from mimetypes import MimeTypes
from os import stat
import os
import sys

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class NewsImageGetHandler(tornado.web.RequestHandler):

    async def get(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:

            fileName = ''
            try:
                apiUrlArray = self.request.uri.split('/')
                fileName = apiUrlArray[len(apiUrlArray) - 1]
            except:
                message = "Invalid File anme"
                raise Exception
            try:
                news = await user_news_folder.find_one(
                    {
                        'attachments.fileName': fileName
                    },
                    {
                        'attachments': 1
                    }
                )
                if news is None:
                    self.set_status(404)
                    return
                else:
                    self.set_header('Content-Type', news.get('attachments')[0]['mimeType'])
                    self.write(
                        news.get('attachments')[0]['rawFile']
                    )
                    return
            except:
                code = 5623
                status = False
                message = 'Internal Error, Please Contact the Support Team.'
                raise Exception
        except Exception as e:
            result = []
            status = False
            code = 4012
            template = 'Exception: {0}. Argument: {1!r}'
            code = 5011
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
