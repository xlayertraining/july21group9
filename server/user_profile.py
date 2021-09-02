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
                    '_id': ObjectId(account_id)
                })
                if account_find:
                    account_find["_id"] = str(account_find["_id"])
                    account_find["firstName"] = (account_find["firstName"]).title()
                    account_find["lastName"] = (account_find["lastName"]).title()
                    account_find["phoneNumber"] = int(account_find["phoneNumber"])
                    result.append(account_find)

                code = 2000
                status = True
                message = "User Profile"

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
            #password
            try:
                password = jsonBody.get('password')
                if password == None:
                    message = "password can't be empty"
                    raise Exception
                if len(password) < 3 or len(password) > 15:
                    message = "please submit valid password[3-20]"
                    raise Exception
            except:
                raise Exception
            #EmailAddress
            try:
                emailAddress = jsonBody.get('emailAddress')
                if emailAddress == None:
                    message = "Email can't be empty"
                    raise Exception
                regex = r'\b[A-Za-z0-9._+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
                if(re.match(regex, emailAddress) == None):
                    code = 3245
                    status = False
                    message = "Email format is invalid!"
                    raise Exception
            except:
                raise Exception
            try:
                account_update = await user_sign_up.update_one({
                    "_id": ObjectId(account_id)
                }, {
                    "$set": {
                        "firstName": firstName,
                        "lastName": lastName,
                        "userName": firstName+" "+lastName,
                        "password": password,
                        "emailAddress": emailAddress
                    }
                }
                )
            except:
                code = 4000
                message = False
                status = "Internal error occured! Please try again later"
                raise Exception
            code = 2000
            status = True
            message = "Profile details has been updated."
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
            await self.finish()
            return
