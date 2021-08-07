from bson import regex
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
            # EmailAddress
            try:
                emailAddress = jsonBody.get("emailAddress")
                if emailAddress == None or emailAddress == "":
                    message = "Please enter valid email address!"
                    raise Exception
                else:
                    regex = r'\b[A-Za-z0-9._+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
                    if(re.match(regex, emailAddress) == None):
                        message = "Email format is invalid!"
                        raise Exception
                    emailAddress = emailAddress.lower()
                emailfind = await user_sign_up.find_one({
                    "emailAddress": emailAddress
                })
                if emailfind:
                    message = "Email is already registered!"
                    raise Exception
            except:
                raise Exception
            # PhoneNumber
            try:
                phoneNumber = int(jsonBody['phoneNumber'])

                if len(str(phoneNumber)) != 10:
                    message = "Please enter valid Phone Number!"
                    raise Exception
                user_phone_confirm = await user_sign_up.find_one(
                    {"phoneNumber": phoneNumber})
                if user_phone_confirm:
                    message = "Phone Number is already Registered!"
                    raise Exception
            except:
                raise Exception
            # Password
            try:
                usrPassword = jsonBody.get('password')
                if len(usrPassword) < 5 or len(usrPassword) > 20:
                    message = "Password limit exceeded[5-20]"
                    raise Exception
            except:
                raise Exception
            user_sign_up.insert_one({
                "firstName": firstName,
                "lastName": lastName,
                "userName": firstName+lastName,
                "phoneNumber": phoneNumber,
                "emailAddress": emailAddress,
                "password": usrPassword
            })
            code = 200
            status = True
            message = "Sign-up Successfull"
            try:
                response = {
                    "code": code,
                    "status": status,
                    "message": message,
                    "result": result
                }
                self.write(response)
                self.finish()
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
            self.write(message)
