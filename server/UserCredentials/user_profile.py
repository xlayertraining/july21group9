from mimetypes import MimeTypes
from os import stat

from tornado.locale import get
from common_library import*
from auth import SecureHeader


class ProfileHandler(tornado.web.RequestHandler):

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
                account_find = await user_sign_up.find_one({
                    "_id": ObjectId(account_id)
                })
                if account_find:
                    account_find["_id"] = str(account_find["_id"])
                    result.append(account_find)
                code = 2000
                status = True
                message = "List of users"

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

    async def put(self):
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
                jsonBody = json.loads(self.request.body)
            except:
                code = 4732
                status = False
                message = "Invalid JSON Body"
                raise Exception

                # Getting Fields Named firstName,lastname,phoneNumber,emailAddress,password
            # firstName
            try:
                firstName = jsonBody.get('firstName')
                if firstName == None:
                    message = "User name can't be empty"
                    raise Exception
                if len(firstName) < 3 or len(firstName) > 20:
                    message = "please submit valid user name[3-20]"
                    raise Exception
                firstName.title()

            except:
                raise Exception
            # LastName
            try:
                lastName = jsonBody.get('lastName')
                if lastName == None:
                    message = "User name can't be empty"
                    raise Exception
                if len(lastName) < 3 or len(lastName) > 15:
                    message = "please submit valid user name[3-20]"
                    raise Exception
                lastName = lastName.title()
            except:
                raise Exception
            account_update = await user_sign_up.update_one({
                "_id": ObjectId(account_id)
            }, {
                "$set": {
                    "firstName": firstName,
                    "lastName": lastName,
                    "userName":firstName+" "+lastName
                }
            }
            )
            code=2000
            status=True
            message="Profile has been updated"
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
