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
                    code = 200
                    status = True
                    message = "Successfully logged in."
                    encoded_jwt = jwt.encode(
                        {"key": str(findUser.get("_id"))}, "icfai", algorithm="HS256")
                    result.append(encoded_jwt)

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
            response = {
                'code': code,
                'status': status,
                'message': message,
                'result': result
            }
            self.write(response)
            self.finish()
            return
