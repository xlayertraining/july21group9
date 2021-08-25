from bson import encode, regex
from common_library import *


class signUpHandler(tornado.web.RequestHandler):
    async def post(self):
        code = 4000
        status = False
        message = ""
        result = []
        try:
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
                    code = 6743
                    status = False
                    message = "User name can't be empty"
                    raise Exception
                if len(firstName) < 3 or len(firstName) > 20:
                    code = 8971
                    status = False
                    message = "please submit valid user name[3-20]"
                    raise Exception
                firstName.title()

            except:
                raise Exception
            # LastName
            try:
                lastName = jsonBody.get('lastName')
                if lastName == None:
                    code = 6743
                    status = False
                    message = "User name can't be empty"
                    raise Exception
                if len(lastName) < 3 or len(lastName) > 15:
                    code = 8971
                    status = False
                    message = "please submit valid user name[3-20]"
                    raise Exception
                lastName = lastName.title()
            except:
                raise Exception
            # EmailAddress
            try:
                emailAddress = jsonBody.get("emailAddress")
                if emailAddress == None or emailAddress == "":
                    code = 6724
                    status = False
                    message = "Please enter valid email address!"
                    raise Exception
                else:
                    regex = r'\b[A-Za-z0-9._+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
                    if(re.match(regex, emailAddress) == None):
                        code = 3245
                        status = False
                        message = "Email format is invalid!"
                        raise Exception
                    emailAddress = emailAddress.lower()
                emailfind = await user_sign_up.find_one({
                    "emailAddress": emailAddress
                })
                if emailfind:
                    code = 9856
                    status = False
                    message = "Email is already registered!"
                    raise Exception
            except:
                raise Exception
            # PhoneNumber
            try:
                phoneNumber = int(jsonBody['phoneNumber'])

                if len(str(phoneNumber)) != 10:
                    code = 4671
                    status = False
                    message = "Please enter valid Phone Number!"
                    raise Exception

                user_phone_confirm = await user_sign_up.find_one(
                    {"phoneNumber": phoneNumber})

                if user_phone_confirm:
                    code = 8261
                    status = False
                    message = "Phone Number is already Registered!"
                    raise Exception
            except:
                raise Exception
            # Password
            try:
                usrPassword = jsonBody.get('password')
                if len(usrPassword) < 5 or len(usrPassword) > 20:
                    code = 7239
                    status = False
                    message = "Password limit exceeded[5-20]"
                    raise Exception
            except:
                raise Exception

            # role
            try:
                role = int(jsonBody['role'])
            except:
                role = 0
            if role < 0 or role > 1:
                code = 4000
                status = False
                message = 'role must be 0-1'
                raise Exception
           
            users_info = await user_sign_up.insert_one({
                "firstName": firstName,
                "lastName": lastName,
                "userName": firstName+" "+lastName,
                "phoneNumber": phoneNumber,
                "emailAddress": emailAddress,
                "role": role,
                "password": usrPassword,
            })
            account_id = str(users_info.inserted_id)

            encoded_jwt = jwt.encode(
                {"key": account_id}, "icfai", algorithm="HS256")

            if type(encoded_jwt) is bytes:
                encoded_jwt = encoded_jwt.decode()
            

            result.append({"Authorization": encoded_jwt})
            code = 200
            status = True
            message = "Sign-up is Successful."

            try:
                response = {
                    "code": code,
                    "status": status,
                    "message": message,
                    "result": result
                }
                self.write(response)
                self.finish()
                return
            except:
                status = False
                code = 5011
                message = 'Internal Error, Please Contact the Support Team.'
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
