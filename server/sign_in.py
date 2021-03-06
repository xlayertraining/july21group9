from common_library import *


class signInHandler(tornado.web.RequestHandler):
    async def post(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:
            try:
                jsonbody = json.loads(self.request.body)

            except:
                code = 4000
                status = False
                message = "Invalid JSON body"
                raise Exception
            # Getting the fields username/emailAddress,password

            # Email-Address
            try:
                emailAddress = jsonbody.get('emailAddress')
                emailAddress.lower()
                if emailAddress == None or emailAddress == "":
                    code = 6724
                    status = False
                    message = "Email cant be empty!"
                    raise Exception

                regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
                if re.match(regex, emailAddress) == None:
                    code = 3245
                    status = False
                    message = "Please submit valid email Address!"
                    raise Exception

                emailFind = await user_sign_up.find_one({"emailAddress": emailAddress})
                if not emailFind:
                    code = 9856
                    status = False
                    message = "Email is not Registered!"
                    raise Exception
            except:
                raise Exception

            # Password
            try:
                userPassword = jsonbody.get('password')
                if userPassword == None or userPassword == "":
                    code = 7239
                    status = False
                    message = "password can't be empty!"
                    raise Exception
            except:
                raise Exception

            try:
                findUser = await user_sign_up.find_one({
                    "emailAddress": emailAddress,
                    "password": userPassword
                })
                if not findUser:
                    code = 4000
                    status = False
                    message = "Invalid email or password!"
                    raise Exception
                else:
                    account_id = str(findUser.get('_id'))

                    encoded_jwt = jwt.encode(
                        {"key": account_id}, "icfai", algorithm="HS256")

                    if type(encoded_jwt) == bytes:
                        encoded_jwt = encoded_jwt.decode()

                    roleText = 'User'
                    if findUser.get('role') == 1:
                        roleText = 'Admin'

                    result.append(
                        {
                            "Authorization": encoded_jwt,
                            'role': roleText
                        }
                    )

                    code = 200
                    status = True
                    message = "Successfully logged in."

                response = {
                    'code': code,
                    'status': status,
                    'message': message,
                    'result': result
                }
                try:
                    self.write(response)
                    self.finish()
                    return
                except Exception as e:
                    template = 'Exception: {0}. Argument: {1!r}'
                    iMessage = template.format(type(e).__name__, e.args)
                    exc_type, exc_obj, exc_tb = sys.exc_info()
                    message="Internal error occured!"
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
            except:
                raise Exception
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
