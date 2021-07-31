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
                print(jsonbody)
            except:
                message = "Invalid JSON body"
                raise Exception
            # Getting the fields username/emailAddress,password

             # Email-Address
            try:
                emailAddress = jsonbody.get('emailAddress')
                emailAddress.lower()
                if emailAddress == None or emailAddress == "":
                    message = "Email cant be empty!"
                    raise Exception

                regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
                if re.match(regex, emailAddress) == None:
                    message = "Please submit valid email Address!"
                    raise Exception

                emailFind = await user_sign_up.find_one({"emailAddress": emailAddress})
                if not emailFind:
                    message = "Email is not Registered!"
                    raise Exception
            except:
                raise Exception

            # Password
            try:
                userPassword = jsonbody.get('password')
                if userPassword == None or userPassword == "":
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
                    message = "Invalid email or password!"

                    raise Exception
                else:
                    code = 200
                    status = True
                    message = "Successfully logged in!"

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
                except:
                    code = 5011
                    status = False
                    message = "Internal Error, Please contact the support team!"
                    response = {
                        'code': code,
                        'status': status,
                        'message': message,
                        'result': result
                    }
                    self.write(response)
                    self.finish()
                    return
            except:
                raise Exception
        except:
            self.write(message)
            self.finish()
